module DynamicPDFApi
  require_relative "TextBarcodeElement"
  require_relative "ElementType"

  #
  # Represents a GS1DataBar barcode element.
  #
  # This class can be used to place a GS1DataBar barcode on a page.
  #
  class Gs1DataBarBarcodeElement < TextBarcodeElement
    #
    # Initializes a new instance of the Gs1DataBarBarcodeElement class.
    #
    # @param value [String] The value of the barcode.
    # @param placement [String] The placement of the barcode on the page.
    # @param height [float] The height of the barcode.
    # @param type [String] The GS1DataBarType of the barcode.
    # @param x_offset [float] The X coordinate of the barcode.
    # @param y_offset [float] The Y coordinate of the barcode.
    #
    def initialize(value, height, type, placement = ElementPlacement::TOP_LEFT, x_offset = 0, y_offset = 0)
      @_type = ElementType::GS1_DATA_BAR_BARCODE
      super(value, placement, x_offset, y_offset)
      @_gs1_data_bar_type = type
      @height = height
    end

    attr_accessor :_type, :_gs1_data_bar_type, :height

    #
    # Gets or sets the height of the barcode.
    #
    def to_json(_options = {})
      json_array = {}

      json_array["type"] = "gs1DataBarBarcode"

      json_array["gs1DataBarType"] = @_gs1_data_bar_type unless @_gs1_data_bar_type.nil?

      json_array["height"] = @height unless @height.nil?

      #----------------TextBarcodeElement---------------------------------
      json_array["font"] = @_font_name unless @_font_name.nil?

      json_array["textColor"] = @text_color._color_string if !@text_color.nil? && !@text_color._color_string.nil?

      json_array["fontSize"] = @font_size unless @font_size.nil?

      json_array["showText"] = @show_text if @show_text != "nil"

      #----------------barcodeElement--------------------------------

      json_array["color"] = @color._color_string if !@color.nil? && !@color._color_string.nil?

      json_array["xDimension"] = @x_dimension unless @x_dimension.nil?

      json_array["value"] = @value unless @value.nil?

      # ------------element---------------------

      json_array["placement"] = @placement unless @placement.nil?

      json_array["xOffset"] = @x_offset unless @x_offset.nil?

      json_array["yOffset"] = @y_offset unless @y_offset.nil?

      # if(@even_pages != nil)
      json_array["evenPages"] = @even_pages

      # if(@odd_pages != nil)
      json_array["oddPages"] = @odd_pages

      JSON.pretty_generate(json_array)
    end
  end
end
