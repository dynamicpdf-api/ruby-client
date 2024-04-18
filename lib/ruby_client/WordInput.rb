module DynamicPDFApi
  require_relative "PageSize"
  require_relative "PageOrientation"
  require_relative "InputType"
  #
  # Represents a Word input.
  #
  class WordInput < ConverterInput

    #
    # Initializes a new instance of the WordInput"/> class.
    #
    # @param name="resource">The resource of type WordResource.
    # @param name="size">The page size of the output PDF.
    # @param name="orientation">The page orientation of the output PDF.
    # @param name="margins">The page margins of the output PDF.
    def initialize(resource, size = PageSize::LETTER, orientation = PageOrientation::PORTRAIT, margins = nil)
      super(resource, size, orientation, margins)
      @_type = InputType::WORD

      @text_replace = Array.new
    end

    def GetTextReplace
      if ((@text_replace != nil && @text_replace.Count > 0))
        @text_replace
      else
        nil
      end
    end

    #
    #  Gets or sets the TextReplace object List.
    #
    attr_accessor :text_replace

    def to_json(_options = {})
      json_array = {}

      json_array["type"] = "word"

      json_array["topMargin"] = @top_margin unless @top_margin.nil?

      json_array["leftMargin"] = @left_margin unless @left_margin.nil?

      json_array["bottomMargin"] = @bottom_margin unless @bottom_margin.nil?

      json_array["rightMargin"] = @right_margin unless @right_margin.nil?

      json_array["pageWidth"] = @page_width unless @page_width.nil?

      json_array["pageHeight"] = @page_height unless @page_height.nil?

      json_array["textReplace"] = @text_replace unless @text_replace.nil?
      #---------------------------------------------------
      json_array["templateId"] = @_template_id unless @_template_id.nil?

      json_array["resourceName"] = @resource_name unless @resource_name.nil?

      json_array["id"] = @id unless @id.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
