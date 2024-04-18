module DynamicPDFApi
  require_relative 'Resource'
  require_relative 'ResourceType'

  #
  # Represents a Dlex resource object that is created using the DLEX file and a name.
  #
  class DlexResource < Resource
    #
    # Initializes a new instance of the DlexResource class with DLEX file path and resource name as parameters.
    #
    # @param dlex [String]|[Array]|[Stream] The dlex file path or the byte array of the dlex file or the stream of the dlex file.
    # @param resource_name [String] The name of the resource.
    #
    def initialize(dlex, resource_name = nil)
      @layout_data_resource_name = nil
      @_type = ResourceType::DLEX
      @_mime_type = 'application/xml'
      super(dlex, resource_name)
    end

    def _file_extension
      '.dlex'
    end

    #
    # Gets or sets name for layout data resource.
    #
    attr_accessor :layout_data_resource_name

    def to_json(_options = {})
      json_array = {}
      json_array['type'] = 'dlex'

      json_array['layoutDataResourceName'] = @layout_data_resource_name
      json_array['resourceName'] = @resource_name
      JSON.pretty_generate(json_array)
    end
  end
end
