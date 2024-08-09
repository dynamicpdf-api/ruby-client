require_relative "ColorFormat"

module DynamicPDFApi
  #
  # Base class for TIFF color formats and used for RGB and Grayscale color formats.
  #
  class TiffColorFormat < ColorFormat
    #
    # Initializes a new instance of the TiffColorFormat class with the specified color format type.
    #
    # @param type [ColorFormatType] The color format type.
    #
    def initialize(type)
      @type = type
    end
  end
end
