module DynamicPDFApi
  require_relative 'Endpoint'
  require_relative 'AdditionalResource'

  class DlexLayout < Endpoint
    #
    # Initializes a new instance of the DlexLayout class using the DLEX file path present in the cloud environment
    # and the JSON data for the PDF report.
    #
    # @param cloud_dlex_path [String] The DLEX file path present in the resource manager.
    # @param layout_data [LayoutDataResource] The LayoutDataResource, json data file used to create the PDF report.
    #
    def initialize(dlex, layout)
      @_endpoint_name = 'dlex-layout'
      @resources= []
      super()
      if(dlex.is_a?(String)) == true && layout.is_a?(Object)
        @dlex_path = dlex
        @resource = layout
      elsif (dlex.is_a?(Object)) == true && layout.is_a?(Object)
        @resources << dlex
        @resource = layout
      end
    end

    #
    # Adds additional resource to the endpoint.
    #
    # <param name="resourcePath">The resource file path.
    # <param name="resourceName">The name of the resource.
    def add_additional_resource(resourcePath, resourceName = nil)

        resourceName = File.basename(resourcePath)  if !resourceName.nil?

        additional_resource = AdditionalResource.new(resourcePath, resourceName)

        if additional_resource.type == ResourceType::LAYOUT_DATA
          raise 'Layout data resources cannot be added to a DlexLayout object.'
        elsif additional_resource.type == ResourceType::DLEX
          raise 'Dlex resources cannot be added to a DlexLayout object.'
        else
          @resources << additional_resource
        end

    end

    def add_additional_resource_with_resourcedata(resourceData, additionalResourceType, resourceName)
      type = ResourceType::PDF
      case (additionalResourceType)

      when AdditionalResourceType::FONT
        type = ResourceType::FONT
      when AdditionalResourceType::IMAGE
        type = ResourceType::IMAGE
      when AdditionalResourceType::PDF
        type = ResourceType::PDF
      else
        raise 'This type of resource not allowed'
      end
      additional_resource = AdditionalResource.new(resourceData, resourceName, type)
      @resources << additional_resource
    end

    attr_accessor :resources

    attr_accessor :resource

    #
    # Gets or sets the DLEX file path present in the resource manager.
    #
    attr_accessor :dlex_path

    #
    # Process the DLEX and layout data to create PDF report.
    #
    # @return PdfResponse Returns collection of PdfResponse tasks.
    #
    def process
      header = {
        'Authorization': "Bearer #{@api_key}",
        'Expect': '100-continue'
      }

      uri = URI.parse("#{@base_url}/v1.0/#{@_endpoint_name}")
      resource_array = []

      resource_array << ['LayoutData', @resource.data, { content_type: @resource._mime_type, filename: @resource.layout_data_resource_name }] if !@resource.nil?

      resource_array << ['DlexPath', @dlex_path,
                         { content_type: 'application/octet-stream', filename: '' }] if !@dlex_path.nil?
                            @resources.each { |field|
                            data = if !field._file_path.nil?
                              File.binread(field._file_path)
                            else
                              field.data
                            end

                          resource_array << ["Resource", data,
                                             { content_type: "application/octet-stream", filename: field.resource_name }]
                          }

      request = Net::HTTP::Post.new(uri.request_uri, header)

      req_options = {
        use_ssl: uri.scheme == 'https',
        verify_mode: OpenSSL::SSL::VERIFY_NONE
      }

      request.set_form(resource_array, 'multipart/form-data')
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      ret_object = PdfResponse.new
      ret_object.is_successful = false
      ret_object.status_code = response.code
      out_data = response.body

      if !ret_object.nil? && ret_object.status_code == '200' && out_data[0, 4].eql?('%PDF') == true
        ret_object = PdfResponse.new(out_data)
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
