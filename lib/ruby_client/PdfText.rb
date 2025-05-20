module DynamicPDFApi
  require_relative 'Endpoint'
  require_relative 'PdfTextResponse'
  require_relative 'TextOrder'

  #
  # Represents the pdf text endpoint.
  #
  class PdfText < Endpoint
    #
    # Initializes a new instance of the PdfText class.
    #
    # @param resource [PdfResource] The image resource of type PdfResource.
    # @param start_page [int] The start page.
    # @param page_count [int] The page count.
    # @param text_order The text extraction order.
    #
    def initialize(resource, start_page = 1, page_count = 0, text_order = TextOrder::STREAM)
      @_endpoint_name = 'pdf-text'
      super()
      @resource = resource
      @start_page = start_page
      @page_count = page_count
      @text_order = text_order
    end

    #
    # Gets or sets the start page.
    #
    attr_accessor :start_page

    #
    # Gets or sets the page count.
    #
    attr_accessor :page_count

    #
    # Gets or sets the text extraction order.
    #
    attr_accessor :text_order

    #
    # Process the pdf resource to get pdf's text.
    # @return PdfTextResponse Returns collection of PdfTextResponse.
    #
    def process
      header = {
        'Authorization': "Bearer #{@api_key}",
        'Content-Length': @resource.data.length.to_s,
        'Expect': '100-continue',
        'Content-Type': 'application/pdf'
      }
      uri = URI.parse("#{@base_url}/v1.0/#{@_endpoint_name}")
      params = { 'startPage' => @start_page, 'pageCount' => @page_count, 'textOrder' => @text_order }
      uri.query = URI.encode_www_form(params)

      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.set_form_data(params)
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
      ret_object = PdfTextResponse.new(out_data)
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
