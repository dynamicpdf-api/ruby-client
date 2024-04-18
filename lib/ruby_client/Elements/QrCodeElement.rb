module DynamicPDFApi
  require_relative 'Dim2BarcodeElement'
  require_relative 'ElementType'

  #
  #
  # Represents a QR code barcode element.
  #
  # With some of the .Net runtime (example: .Net Core 2.0), the Kanchi encoding will give the error 'No
  # data is available for encoding 932. For information on defining a custom encoding, see the documentation
  # for the Encoding.RegisterProvider method.'.
  #
  class QrCodeElement < Dim2BarcodeElement
    #
    # Initializes a new instance of the QrCodeElement class.
    #
    # @param value [String]|array The value of the QR code either as string or byte array.
    # @param placement [String] The placement of the barcode on the page.
    # @param x_offset [float] The X coordinate of the QR code.
    # @param y_offset [float] The Y coordinate of the QR code.
    #
    def initialize(value, placement= ElementPlacement::TOP_LEFT, x_offset = 0, y_offset = 0)
      super(value, placement, x_offset, y_offset)
      @_type = ElementType::QR_CODE
    end

    attr_accessor :_type

    #
    # Gets or sets FNC1 mode.
    #
    attr_accessor :fnc1

    #
    # Gets or sets the QR code version.
    #
    attr_accessor :version

    def to_json(_options = {})
      json_array = {}

      json_array['type'] = 'qrCode'

      json_array['fnc1'] = @fnc1 unless @fnc1.nil?

      json_array['version'] = @version unless @version.nil?

      #--------------Dim2BarcodeElement------------------------------

      json_array['valueType'] = @_value_type unless @_value_type.nil?

      #----------------barcodeElement--------------------------------

      json_array['color'] = @color._color_string if !@color.nil? && !@color._color_string.nil?

      json_array['xDimension'] = @x_dimension unless @x_dimension.nil?

      json_array['value'] = @value unless @value.nil?

      # ------------element---------------------

      json_array['placement'] = @placement unless @placement.nil?

      json_array['xOffset'] = @x_offset unless @x_offset.nil?

      json_array['yOffset'] = @y_offset unless @y_offset.nil?

      # if(@even_pages != nil)
      json_array['evenPages'] = @even_pages

      # if(@odd_pages != nil)
      json_array['oddPages'] = @odd_pages

      JSON.pretty_generate(json_array)
    end
  end
end
