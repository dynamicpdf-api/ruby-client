module DynamicPDFApi
  require_relative "Element"
  require_relative "ElementPlacement"

  #
  # Base class from which barcode page elements are derived.
  #
  class BarcodeElement < Element
    def initialize(value, placement, x_offset, y_offset)
      @color = nil
      @x_dimension = nil

      super(value, placement, x_offset, y_offset)
      @value = value
    end

    attr_accessor :_color_name

    #
    # Gets or sets the Color of the barcode.
    #
    def color=(color_value)
      @color = color_value
      @_color_name = @color._color_string
    end

    #
    # Gets or sets the XDimension of the barcode.
    #
    attr_accessor :x_dimension

    #
    # Gets or sets the value of the barcode.
    #
    attr_accessor :value
  end
end
