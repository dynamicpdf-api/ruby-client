module DynamicPDFApi
  require_relative "PageSize"
  require_relative "PageOrientation"
  require_relative "InputType"
  #
  # Represents a Excel input.
  #
  class ExcelInput < ConverterInput

    #
    # Initializes a new instance of the ExcelInput"/> class.
    #
    # @param name="resource">The resource of type ExcelResource.
    # @param name="size">The page size of the output PDF.
    # @param name="orientation">The page orientation of the output PDF.
    # @param name="margins">The page margins of the output PDF.
    def initialize(resource, size = nil, orientation = nil, margins = nil)
      super(resource, size, orientation, margins)
      @_type = InputType::EXCEL

    end

    def to_json(_options = {})
      json_array = {}

      json_array["type"] = "excel"

      json_array["topMargin"] = @top_margin unless @top_margin.nil?

      json_array["leftMargin"] = @left_margin unless @left_margin.nil?

      json_array["bottomMargin"] = @bottom_margin unless @bottom_margin.nil?

      json_array["rightMargin"] = @right_margin unless @right_margin.nil?

      json_array["pageWidth"] = @page_width unless @page_width.nil?

      json_array["pageHeight"] = @page_height unless @page_height.nil?

      json_array["templateId"] = @_template_id unless @_template_id.nil?

      json_array["resourceName"] = @resource_name unless @resource_name.nil?

      json_array["id"] = @id unless @id.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
