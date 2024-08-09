module DynamicPDFApi

  require_relative 'ImageFormatType'
  require_relative 'ImageFormat'

  #
  # Represents PNG image format with color format.
  #
  class PngImageFormat < ImageFormat
    attr_accessor :color_format  # Gets or sets the PngColorFormat for PNG.

    #
    # Initializes a new instance of the PngImageFormat class.
    #
    def initialize
      super(ImageFormatType::PNG)
      @color_format = nil
    end

    #
    # Returns a JSON representation of the PngImageFormat object.
    #
    # @return [String] JSON string representing the PngImageFormat object.
    #
    def to_json(_options = {})
      json_array = {}
      json_array['type'] = 'png'

      json_array['colorFormat'] = @color_format
      JSON.pretty_generate(json_array)
    end
  end
end
