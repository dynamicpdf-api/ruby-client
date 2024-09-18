# Ruby client api namespace
module DynamicPDFApi
  require_relative "Element"
  require_relative "ElementType"
  require_relative "AztecSymbolSize"
  require_relative "BarcodeElement"
  require_relative "Dim2BarcodeElement"

  #
  # Represents an Aztec barcode element.
  #
  # With some of the .Net runtime (example: .Net Core 2.0) the ECI values 20, 28, 29 and 30 will give the
  # error 'No data is available for encoding 'code page number'. For information on defining a custom encoding,
  # see the documentation for the Encoding.RegisterProvider method.'.
  #
  class AztecBarcodeElement < Dim2BarcodeElement
    #
    # Initializes a new instance of the AztecBarcodeElement class.
    #
    # @param value [String]|[array] The value of the barcode either as string or byte array.
    # @param placement [String] The placement of the barcode on the page.
    # @param x_offset [float] The X coordinate of the barcode.
    # @param y_offset [float] The Y coordinate of the barcode.
    #
    def initialize(value, placement = ElementPlacement::TOP_LEFT, x_offset = 0, y_offset = 0)
      @_type = ElementType::AZTEC_BARCODE
      @process_tilde = nil
      @symbol_size = nil
      @aztec_error_correction = 0
      @reader_initialization_symbol = nil
      super(value, placement, x_offset, y_offset)
    end

    attr_accessor :type

    #
    # Gets or Sets a boolean indicating whether to process tilde symbol in the input.
    #
    # Setting true will check for ~ character and processes it for FNC1 or ECI characters. With some of the
    # .Net runtime (example: .Net Core 2.0), the ECI values 20, 28, 29 and 30 will give the error 'No data
    # is available for encoding 'code page number'. For information on defining a custom encoding, see the
    # documentation for the Encoding.RegisterProvider method.'.
    #
    #
    attr_accessor :process_tilde

    #
    # Gets or Sets the barcode size, AztecSymbolSize.
    #
    attr_accessor :symbol_size

    #
    # Gets or Sets the error correction value.
    #
    # Error correction value may be between 5% to 95%.
    #
    attr_accessor :aztec_error_correction

    #
    # Gets or Sets a boolean representing if the barcode is a reader initialization symbol.
    #
    # Setting true will mark the symbol as reader initialization symbol and the size of the symbol should be
    # one of the following, R15xC15 Compact, R19xC19, R23xC23, R27xC27, R31xC31, R37xC37, R41xC41, R45xC45,
    # R49xC49, R53xC53, R57xC57, R61xC61, R67xC67, R71xC71, R75xC75, R79xC79, R83xC83, R87xC87, R91xC91, R95xC95,
    # R101xC101, R105xC105, R109xC109, however it is recommended to set Auto.
    #
    attr_accessor :reader_initialization_symbol

    def to_json(_options = {})
      json_array = {}

      json_array["type"] = "aztecBarcode"

      json_array["processTilde"] = @process_tilde unless @process_tilde.nil?

      json_array["symbolSize"] = @symbol_size unless @symbol_size.nil?

      json_array["aztecErrorCorrection"] = @aztec_error_correction unless @aztec_error_correction.nil?

      json_array["readerInitializationSymbol"] = @reader_initialization_symbol unless @reader_initialization_symbol.nil?

      #--------------Dim2BarcodeElement------------------------------

      json_array["valueType"] = @_value_type unless @_value_type.nil?

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
