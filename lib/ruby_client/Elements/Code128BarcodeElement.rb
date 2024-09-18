module DynamicPDFApi
  require_relative "Element"
  require_relative "ElementType"
  require_relative "TextBarcodeElement"

  #
  # Represents a Code 128 barcode element.
  #
  # This class can be used to place a Code 128 barcode on a page.
  #
  class Code128BarcodeElement < TextBarcodeElement
    #
    # Initializes a new instance of the Code128BarcodeElement class.
    #
    # Code sets can be specified along with data, in order to do this ProcessTilde property needs to be set
    # to true. Example value: '~BHello ~AWORLD 1~C2345', where ~A, ~B and ~C representing code sets A, B and
    # C respectively. However if any inline code set has invalid characters it will be shifted to an appropriate
    # code set.
    #
    # @param value [String] The value of the barcode.
    # @param placement [String] The placement of the barcode on the page.
    # @param height [float] The height of the barcode.
    # @param x_offset [float] The X coordinate of the barcode.
    # @param y_offset [float] The Y coordinate of the barcode.
    #
    def initialize(value, height, placement = ElementPlacement::TOP_LEFT, x_offset = 0, y_offset = 0)
      @ucc_ean128 = nil
      @process_tilde = nil
      @_type = ElementType::CODE128_BARCODE
      super(value, placement, x_offset, y_offset)
      @height = height
    end

    attr_accessor :_type

    #
    # Gets or sets the height of the barcode.
    #
    attr_accessor :height

    #
    # Gets or sets a boolean representing if the barcode is a UCC / EAN Code 128 barcode.
    #
    # If true an FNC1 code will be the first character in the barcode.
    #
    attr_accessor :ucc_ean128

    #
    # Gets or Sets a boolean indicating whether to process the tilde character.
    #
    # If true checks for fnc1 (~1) character in the barcode Value and checks for the inline code sets if present
    # in the data to process. Example value: '~BHello ~AWORLD 1~C2345', where ~A, ~B and ~C representing code
    # sets A, B and C respectively. However if any inline code set has invalid characters it will be shifted
    # to an appropriate code set. '\' is used as an escape character to add ~.
    #
    attr_accessor :process_tilde

    def to_json(_options = {})
      json_array = {}

      json_array["type"] = "code128Barcode"

      json_array["height"] = @height unless @height.nil?

      json_array["uccEan128"] = @ucc_ean128 unless @ucc_ean128.nil?

      json_array["processTilde"] = @process_tilde unless @process_tilde.nil?

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
