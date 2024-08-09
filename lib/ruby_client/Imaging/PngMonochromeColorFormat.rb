module DynamicPDFApi
  require_relative 'PngColorFormat'
  require_relative 'ColorFormatType'

  #
  # Represents monochrome color format for PNG with black threshold.
  #
  class PngMonochromeColorFormat < PngColorFormat
    attr_accessor :black_threshold     # Gets or sets the black threshold for monochrome PNG, ranges from 0-255.
    attr_accessor :dithering_percent   # Gets or sets the dithering percentage for PNG.
    attr_accessor :dithering_algorithm # Gets or sets the DitheringAlgorithm for PNG.

    #
    # Initializes a new instance of the PngMonochromeColorFormat class with monochrome color format type.
    #
    def initialize
      super(ColorFormatType::Monochrome)
      @black_threshold = nil
      @dithering_percent = nil
      @dithering_algorithm = nil
    end
  end
end
