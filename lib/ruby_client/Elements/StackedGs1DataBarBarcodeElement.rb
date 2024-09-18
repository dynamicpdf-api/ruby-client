module DynamicPDFApi
  require_relative 'TextBarcodeElement'
  require_relative 'ElementType'

  #
  # Represents a StackedGS1DataBar barcode element.
  #
  # This class can be used to place a StackedGS1DataBar barcode on a page.
  #
  class StackedGs1DataBarBarcodeElement < TextBarcodeElement
    #
    # Initializes a new instance of the StackedGs1DataBarBarcodeElement class.
    #
    # @param value [String] The value of the barcode.
    # @param placement [String] The placement of the barcode on the page.
    # @param stacked_gs1_data_bar_type [String] The StackedGS1DataBarType of the barcode.
    # @param row_height [float] The row height of the barcode.
    # @param x_offset [float] The X coordinate of the barcode.
    # @param y_offset [float] The Y coordinate of the barcode.
    #
    def initialize(value,  stacked_gs1_data_bar_type, row_height, placement= ElementPlacement::TOP_LEFT, x_offset = 0, y_offset = 0)
      super(value, placement, x_offset, y_offset)
      @_stacked_gs1_data_bar_type = stacked_gs1_data_bar_type
      @row_height = row_height
      @_type = ElementType::STACKED_GS1_DATA_BAR_BARCODE
    end

    attr_accessor :_type, :_stacked_gs1_data_bar_type

    #
    # Gets or Sets the segment count of the Expanded Stacked barcode.
    #
    # This is used only for the ExpandedStacked Gs1DataBar type.
    #
    attr_accessor :expanded_stacked_segment_count

    #
    # Gets or sets the row height of the barcode.
    #
    attr_accessor :row_height

    def to_json(_options = {})
      json_array = {}

      json_array['type'] = 'stackedGs1DataBarBarcode'

      json_array['stackedGs1DataBarType'] = @_stacked_gs1_data_bar_type unless @_stacked_gs1_data_bar_type.nil?

      unless @expanded_stacked_segment_count.nil?
        json_array['expandedStackedSegmentCount'] =
          @expanded_stacked_segment_count
      end

      json_array['rowHeight'] = @row_height unless @row_height.nil?

      #----------------TextBarcodeElement---------------------------------
      json_array['font'] = @_font_name unless @_font_name.nil?

      json_array['textColor'] = @text_color._color_string if !@text_color.nil? && !@text_color._color_string.nil?

      json_array['fontSize'] = @font_size unless @font_size.nil?

      json_array["showText"] = @show_text unless @show_text.nil?

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
