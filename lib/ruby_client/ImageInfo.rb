module DynamicPDFApi
  require_relative 'Endpoint'
  require_relative 'ImageResponse'

  #
  # Represents an image information endpoint.
  #
  class ImageInfo < Endpoint
    #
    # Initializes a new instance of the ImageInfo class.
    #
    # ImageResource resource The image resource of type ImageResource.
    #
    def initialize(resource)
      @_endpoint_name = 'image-info'
      super()
      @resource = resource
    end

    #
    # Process the image resource to get image's information.
    #
    # @return ImageResponse Returns collection of ImageResponse.
    #
    def process
      header = {
        'Authorization': "Bearer #{@api_key}",
        'Content-Length': @resource.data.length.to_s,
        'Expect': '100-continue',
        'Content-Type': "image/#{@resource._file_extension[1, @resource._file_extension.length - 1]}"
      }
      uri = URI.parse("#{@base_url}/v1.0/#{@_endpoint_name}")

      request = Net::HTTP::Post.new(uri.request_uri, header)

      req_options = {
        use_ssl: uri.scheme == 'https',
        verify_mode: OpenSSL::SSL::VERIFY_NONE

      }

      request.content_type = "image/#{@resource._file_extension[1, @resource._file_extension.length - 1]}"

      request.body = @resource.data

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      out_data = response.body
      ret_object = ImageResponse.new(out_data)
      ret_object.is_successful = false
      ret_object.status_code = response.code
      if ret_object.status_code == '200'
        ret_object.is_successful = true
      else
        if ret_object.status_code == '401'
          raise "Invalid api key specified."
        end
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
