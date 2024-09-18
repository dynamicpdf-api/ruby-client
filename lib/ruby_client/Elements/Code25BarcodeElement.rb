module DynamicPDFApi
  require_relative "TextBarcodeElement"
  require_relative "ElementPlacement"
  require_relative "ElementType"

  #
  # Represents a Code 2 of 5 barcode element.
  #
  # This class can be used to place a Code 2 of 5 barcode on a page.
  #
  class Code25BarcodeElement < TextBarcodeElement
    #
    # Initializes a new instance of the Code25BarcodeElement class.
    #
    # @param value [String] The value of the barcode.
    # @param placement [String] The placement of the barcode on the page.
    # @param height [float] The height of the barcode.
    # @param x_offset [float] The X coordinate of the barcode.
    # @param y_offset [float] The Y coordinate of the barcode.
    #
    def initialize(value, height, placement = ElementPlacement::TOP_LEFT, x_offset = 0, y_offset = 0)
      super(value, placement, x_offset, y_offset)
      @height = height
      @_type = ElementType::CODE25_BARCODE
    end

    attr_accessor :_type

    #
    # Gets or sets the height of the barcode.
    #
    attr_accessor :height

    def to_json(_options = {})
      json_array = {}

      json_array["type"] = "code25Barcode"

      json_array["height"] = @height unless @height.nil?

      #----------------TextBarcodeElement---------------------------------
      json_array["font"] = @_font_name unless @_font_name.nil?

      json_array["textColor"] = @text_color._color_string if !@text_color.nil? && !@text_color._color_string.nil?

      json_array["fontSize"] = @font_size unless @font_size.nil?

      json_array["showText"] = @show_text unless @show_text.nil?

      #----------------barcodeElement--------------------------------

      json_array["color"] = @color._color_string if !@color.nil? && !@color._color_string.nil?

      json_array["xDimension"] = @x_dimension unless @x_dimension.nil?

      json_array["value"] = @value unless @value.nil?

      # ------------element---------------------

      json_array["placement"] = @placement unless @placement.nil?

      json_array["xOffset"] = @x_offset unless @x_offset.nil?

      json_array["yOffset"] = @y_offset unless @y_offset.nil?

      json_array["evenPages"] = @even_pages unless @even_pages.nil?

      json_array["oddPages"] = @odd_pages unless @odd_pages.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
