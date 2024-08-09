module DynamicPDFApi
  require_relative 'ImageFormat'
  require_relative 'ImageFormatType'

  #
  # Represents BMP image format with color format.
  #
  class BmpImageFormat < ImageFormat
    attr_accessor :color_format  # Gets or sets the BmpColorFormat for BMP.

    #
    # Initializes a new instance of the BmpImageFormat class.
    #
    def initialize
      super(ImageFormatType::BMP)
      @color_format = nil
    end

    #
    # Returns a JSON representation of the BmpImageFormat object.
    #
    # @return [String] JSON string representing the BmpImageFormat object.
    #
    def to_json(_options = {})
      json_array = {}
      json_array['type'] = 'bmp'

      json_array['colorFormat'] = @color_format
      JSON.pretty_generate(json_array)
    end
  end
end
