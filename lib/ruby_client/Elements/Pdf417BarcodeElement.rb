module DynamicPDFApi
  require_relative 'Dim2BarcodeElement'
  require_relative 'ErrorCorrection'
  require_relative 'ElementType'
  require_relative 'Compaction'

  #
  # Represents Pdf417 barcode element.
  #
  # This class can be used to generate Pdf417 barcode symbol.
  #
  class Pdf417BarcodeElement < Dim2BarcodeElement
    #
    # Initializes a new instance of the Pdf417BarcodeElement class.
    #
    # @param value [String]|array String to be encoded either as string or byte array.
    # @param placement [String] The placement of the barcode on the page.
    # @param columns int [Columns] of the PDF417 barcode.
    # @param x_offset [float] The X coordinate of the PDF417 barcode.
    # @param y_offset [float] The Y coordinate of the PDF417 barcode.
    #
    def initialize(value,  columns, placement= ElementPlacement::TOP_LEFT, x_offset = 0, y_offset = 0)
      @columns = nil
      @y_dimension = nil
      @process_tilde = nil
      @compact_pdf417 = nil
      @error_correction = nil
      @compaction = nil

      super(value, placement, x_offset, y_offset)
      @columns = columns
      @_type = ElementType::PDF417_BARCODE
    end

    attr_accessor :_type

    #
    # Gets or sets the columns of the barcode.
    #
    attr_accessor :columns

    #
    # Gets or sets the YDimension of the barcode.
    #
    attr_accessor :y_dimension

    #
    # Gets or Sets a boolean indicating whether to process the tilde character.
    #
    attr_accessor :process_tilde
    #
    # Gets or sets the Compact Pdf417.
    #
    attr_accessor :compact_pdf417
    #
    # Gets or sets the error correction level for the PDF417 barcode.
    #
    attr_accessor :error_correction
    #
    # Gets or sets the type of compaction.
    #
    attr_accessor :compaction

    def to_json(_options = {})
      json_array = {}

      json_array['type'] = 'pdf417Barcode'

      json_array['columns'] = @columns unless @columns.nil?

      json_array['yDimension'] = @y_dimension unless @y_dimension.nil?

      json_array["processTilde"] = @process_tilde unless @process_tilde.nil?

      json_array['compactPdf417'] = @compact_pdf417 unless @compact_pdf417.nil?

      json_array['errorCorrection'] = @error_correction unless @error_correction.nil?

      json_array['compaction'] = @compaction unless @compaction.nil?

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

      json_array["evenPages"] = @even_pages unless @even_pages.nil?

      json_array["oddPages"] = @odd_pages unless @odd_pages.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
