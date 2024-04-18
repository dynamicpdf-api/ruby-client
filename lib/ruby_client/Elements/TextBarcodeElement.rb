module DynamicPDFApi
  require_relative 'BarcodeElement'

  #
  # Base class from which barcode page elements that display text are derived.
  #
  class TextBarcodeElement < BarcodeElement
    def initialize(value, placement, x_offset, y_offset)
      @text_color = nil
      @font_size = nil
      @show_text = 'nil'
      @_resource = nil
      @_text_font = nil
      @_font_name = nil
      super(value, placement, x_offset, y_offset)
    end

    #
    # Gets or sets the color of the text.
    #
    attr_accessor :text_color

    #
    # Gets or sets the font size to use when displaying the text.
    #
    attr_accessor :font_size

    #
    # Gets or sets a value indicating if the value should be placed as text below the barcode.
    #
    attr_accessor :show_text

    attr_accessor :_resource, :_text_font, :_font_name

    #
    # Gets or sets the font to use when displaying the text.
    #
    def font(value)
      @_text_font = value
      @_font_name = @_text_font._name
      @_resource = @_text_font._resource
    end

    def get_font
      @_text_font
    end
  end
end
