module DynamicPDFApi
  require_relative "UnitConverter"
  #
  # Represents a html input.
  #
  class HtmlInput < ConverterInput

    #
    # Initializes a new instance of the HtmlInput class.
    #
    # @param resource [HtmlResource] The resource of type HtmlResource.
    # @param base_path [string] The base_path options for the url.
    # @param size [PageSize] The page size of the output PDF.
    # @param orientation [PageOrientation] The page orientation of the output PDF.
    # @param margins [float] The page margins of the output PDF.
    def initialize(resource, base_path = nil, size = nil, orientation = nil, margins = nil)
      super(resource, size, orientation, margins)

      @_type = InputType::HTML

      if (base_path != nil)
        @base_path = base_path
      end
    end

    #
    # Gets or sets the base path option.
    #
    attr_accessor :base_path

    def to_json(_options = {})
      json_array = {}

      json_array["type"] = "html"

      json_array["basePath"] = @scale_x unless @scale_x.nil?

      json_array["topMargin"] = @top_margin unless @top_margin.nil?

      json_array["leftMargin"] = @left_margin unless @left_margin.nil?

      json_array["bottomMargin"] = @bottom_margin unless @bottom_margin.nil?

      json_array["rightMargin"] = @right_margin unless @right_margin.nil?

      json_array["pageWidth"] = @page_width unless @page_width.nil?

      json_array["pageHeight"] = @page_height unless @page_height.nil?

      #---------------------------------------------------
      json_array["templateId"] = @_template_id unless @_template_id.nil?

      json_array["resourceName"] = @resource_name unless @resource_name.nil?

      json_array["id"] = @id unless @id.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
