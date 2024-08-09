module DynamicPDFApi
  require_relative 'ColorFormatType'
  require_relative 'ColorFormat'

  #
  # Base class for PNG color formats, used for RGB, RGBA, and Grayscale color formats.
  #
  class PngColorFormat < ColorFormat
    #
    # Initializes a new instance of the PngColorFormat class.
    #
    # @param type [ColorFormatType] The color format type.
    #
    def initialize(type)
      @type = type
    end
  end
end
