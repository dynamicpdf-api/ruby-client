module DynamicPDFApi
  require_relative 'Endpoint'
  require_relative 'PdfInfoResponse'

  #
  # Represents the pdf info endpoint.
  #
  class PdfInfo < Endpoint
    #
    # Initializes a new instance of the PdfInfo class.
    #
    # @param resource [PdfResource] The resource of type PdfResource.
    #
    def initialize(resource)
      super()
      @resource = resource
      @_endpoint_name = 'pdf-info'
    end

    #
    # Process the pdf resource to get pdf's information.
    # @return PdfInfoResponse Returns collection of PdfInfoResponse.
    #
    def process
      header = {
        'Authorization': "Bearer #{@api_key}",
        'Content-Length': @resource.data.length.to_s,
        'Expect': '100-continue',
        'Content-Type': 'application/pdf'
      }
      uri = URI.parse("#{@base_url}/v1.0/#{@_endpoint_name}")

      request = Net::HTTP::Post.new(uri.request_uri, header)

      req_options = {
        use_ssl: uri.scheme == 'https',
        verify_mode: OpenSSL::SSL::VERIFY_NONE

      }

      request.content_type = 'application/pdf'

      request.body = @resource.data

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      out_data = response.body
      ret_object = PdfInfoResponse.new(out_data)
      ret_object.is_successful = false
      ret_object.status_code = response.code
      if ret_object.status_code == '200'
        ret_object.is_successful = true
      else
        out_data_json = JSON.parse(out_data)
        ret_object.error_json = out_data
        ret_object.error_message = if !out_data_json['message'].nil?
                                     out_data_json['message']
                                   else
                                     "status_code : #{Net::HTTPResponse::CODE_TO_OBJ[ret_object.status_code]}"
                                   end
        ret_object.error_id = out_data_json['id']
      end

      ret_object
    end
  end
end
