module DynamicPDFApi
  require 'base64'

  require_relative 'BarcodeElement'
  require_relative 'ElementPlacement'
  require_relative 'ValueType'

  #
  # The base class for 2 dimensional barcode (Aztec, Pdf417, DataMatrixBarcode and QrCode).
  #
  class Dim2BarcodeElement < BarcodeElement
    def initialize(value, placement, x_offset, y_offset)
      if value.is_a?(String)
        @_value_type = ValueType::STRING
        super(value, placement, x_offset, y_offset)
      else
        super(value, placement, x_offset, y_offset)
        @_value_type = ValueType::BASE64_ENCODED_BYTES
        @value = Base64.encode64(value.pack('C*'))
        @placement = placement
        @x_offset = x_offset
        @y_offset = y_offset
      end
    end

    attr_accessor :_value_type
  end
end
