module DynamicPDFApi
  require_relative 'Resource'
  require_relative 'ResourceType'

  #
  #
  # Represents the Layout data resource used to create the PDF reports.
  #
  class LayoutDataResource < Resource
    #
    # Initializes a new instance of the LayoutDataResource class using the layout data object and a resource
    # name.
    #
    # @param layout [Object]|[String] Serializable object data to create PDF report or the layout data JSON file path.
    # @param layout_data_resource_name [String] The name for layout data resource.
    #
    def initialize(layout = nil, layout_data_resource_name = nil)
      super()
      @data = if layout.is_a?(String)
                Resource._get_file_data(layout)
              else
                layout.to_json
              end
      @layout_data_resource_name = if layout_data_resource_name.nil?
                                     "#{SecureRandom.uuid}.json"
                                   else
                                     layout_data_resource_name
                                   end

      @_mime_type = 'application/json'
      @_type = ResourceType::LAYOUT_DATA
      @resource_name = @layout_data_resource_name
    end

    def _file_extension
      '.json'
    end

    #
    # Gets or sets name of the layout data resource.
    #
    attr_accessor :layout_data_resource_name

    def to_json(_options = {})
      JSON.pretty_generate({})
    end
  end
end
