module DynamicPDFApi
  require_relative "Dim2BarcodeElement"
  require_relative "ElementPlacement"
  require_relative "ElementType"
  require_relative "DataMatrixSymbolSize"
  require_relative "DataMatrixEncodingType"
  require_relative "DataMatrixFunctionCharacter"

  #
  # Represents a Data Matrix  barcode element.
  #
  # With some of the .Net runtime (example: .Net Core 2.0), the ECI values 20, 28, 29 and 30 will give the
  # error 'No data is available for encoding 'code page number'. For information on defining a custom encoding,
  # see the documentation for the Encoding.RegisterProvider method.'.
  #
  class DataMatrixBarcodeElement < Dim2BarcodeElement
    #
    # Initializes a new instance of the DataMatrixBarcodeElement class.
    #
    # @param value [String]|array The value of the barcode either as string or as byte array.
    # @param placement [String] The placement of the barcode on the page.
    # @param x_offset [float] The X coordinate of the barcode.
    # @param y_offset [float] The Y coordinate of the barcode.
    # @param symbol_size [String] The symbol size of the barcode.
    # @param encoding_type [String] The encoding type of the barcode.
    # @param function_character [String] The def character of the barcode.
    #
    def initialize(value, placement = ElementPlacement::TOP_LEFT, x_offset = 0, y_offset = 0, symbol_size = DataMatrixSymbolSize::AUTO, encoding_type = DataMatrixEncodingType::AUTO, function_character = DataMatrixFunctionCharacter::NONE)
      @process_tilde = nil
      @_type = ElementType::DATA_MATRIX_BARCODE
      super(value, placement, x_offset, y_offset)
      @_data_matrix_symbol_size = symbol_size
      @_data_matrix_encoding_type = encoding_type
      @_data_matrix_function_character = function_character
    end

    attr_accessor :_type, :_data_matrix_symbol_size, :_data_matrix_encoding_type, :_data_matrix_function_character

    #
    # Gets or sets whether to process tilde character.
    #
    # Setting true will check for ~ character and processes it for FNC1 or ECI characters. With some of the
    # .Net runtime (example: .Net Core 2.0), the ECI values 20, 28, 29 and 30 will give the error 'No data
    # is available for encoding 'code page number'. For information on defining a custom encoding, see the
    # documentation for the Encoding.RegisterProvider method.'.
    #
    attr_accessor :process_tilde

    def to_json(_options = {})
      json_array = {}

      json_array["type"] = "dataMatrixBarcode"

      json_array["processTilde"] = @process_tilde unless @process_tilde.nil?

      json_array["dataMatrixSymbolSize"] = @_data_matrix_symbol_size unless @_data_matrix_symbol_size.nil?

      json_array["dataMatrixEncodingType"] = @_data_matrix_encoding_type unless @_data_matrix_encoding_type.nil?

      unless @_data_matrix_function_character.nil?
        json_array["dataMatrixFunctionCharacter"] =
          @_data_matrix_function_character
      end

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
