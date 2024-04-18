module DynamicPDFApi
  require_relative 'Input'
  require_relative 'DlexResource'
  require_relative 'LayoutDataResource'
  require_relative 'InputType'

  #
  # Represents a Dlex input.
  #
  class DlexInput < Input
    #
    # Initializes a new instance of the DlexInput class by posting the DLEX file and the JSON data file from
    # the client to the API to create the PDF report.
    #
    # @param dlex [String]|[DlexResource] The DLEX file path present in the resource manager or the DlexResource file created as per the desired PDF report layout design.
    # @param layout [String]|[LayoutDataResource] The JSON data file path present in the resource manager used to create the PDF report or the LayoutDataResource file used to create the PDF report.
    #
    def initialize(dlex, layout)
      super()
      @_resources = []
      @_type = InputType::DLEX

      if (dlex.is_a?(String)) == true && layout.is_a?(String)
        # super()
        @resource_name = dlex
        @layout_data_resource_name = layout
      elsif (dlex.is_a?(String)) == true && layout.is_a?(Object)
        @resource_name = dlex
        @layout_data_resource_name = layout.layout_data_resource_name
        @_resources << layout
      elsif (dlex.is_a?(Object)) == true && layout.is_a?(Object)
        @resource_name = dlex.resource_name
        @layout_data_resource_name = layout.layout_data_resource_name
        # dlex.LayoutDataResourceName=@LayoutDataResourceName

        @_resources << layout
        @_resources << dlex
      end
    end

    #
    # Gets or sets the name for layout data resource.
    #
    attr_accessor :layout_data_resource_name

    def to_json(_options = {})
      json_array = {}
      json_array['type'] = 'dlex'
      json_array['layoutDataResourceName'] = @layout_data_resource_name

      #---------------------------------------------------
      json_array['templateId'] = @_template_id unless @_template_id.nil?

      json_array['resourceName'] = @resource_name unless @resource_name.nil?

      json_array['id'] = @id unless @id.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
