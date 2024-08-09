module DynamicPDFApi
  require_relative "ImageSize"
  require_relative "ImageSizeType"


  #
  # Represents an image size with fixed dimensions.
  #
  class FixedImageSize < ImageSize
    attr_accessor :width  # Gets or sets the width of the image.
    attr_accessor :height  # Gets or sets the height of the image.
    attr_accessor :unit  # Gets or sets the unit of measurement ImageSizeUnit for the width and height.

    #
    # Initializes a new instance of the FixedImageSize class and sets the image size type to Fixed.
    #
    def initialize
      super()
      @type = ImageSizeType::Fixed
      @width = nil
      @height = nil
      @unit = nil
    end

    #
    # Returns a JSON representation of the FixedImageSize object.
    #
    # @return [String] JSON string representing the FixedImageSize object.
    #
    def to_json(_options = {})
      json_array = {}
      json_array['type'] = 'fixed'
      json_array['width'] = @width
      json_array['height'] = @height
      json_array['unit'] = @unit
      JSON.pretty_generate(json_array)
    end
  end
end
