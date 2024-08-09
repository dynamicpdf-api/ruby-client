module DynamicPDFApi
  require_relative "ImageSize"
  require_relative "ImageSizeType"
  #
  # Represents an image size defined by DPI (Dots Per Inch).
  #
  class DpiImageSize < ImageSize
    attr_accessor :horizontal_dpi  # Gets or sets the horizontal DPI (Dots Per Inch) of the image.
    attr_accessor :vertical_dpi    # Gets or sets the vertical DPI (Dots Per Inch) of the image.

    #
    # Initializes a new instance of the DpiImageSize class and sets the image size type to DPI.
    #
    def initialize
      super
      @horizontal_dpi = nil
      @vertical_dpi = nil
      @type = ImageSizeType::Dpi
    end

    #
    # Returns a JSON representation of the DpiImageSize object.
    #
    # @return [String] JSON string representing the DpiImageSize object.
    #
    def to_json(_options = {})
      json_array = {}
      json_array['type'] = 'dpi'

      json_array['horizontalDpi'] = @horizontal_dpi
      json_array['verticalDpi'] = @vertical_dpi

      JSON.pretty_generate(json_array)
    end
  end
end
