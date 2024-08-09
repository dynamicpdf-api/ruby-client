module DynamicPDFApi
  require_relative "ImageSize"
  require_relative "ImageSizeType"

  #
  # Represents an image size that fits within a specified maximum width and height.
  #
  class MaxImageSize < ImageSize
    attr_accessor :max_width  # Gets or sets the maximum width of the image.
    attr_accessor :max_height  # Gets or sets the maximum height of the image.
    attr_accessor :unit  # Gets or sets the unit of measurement for the maximum width and height.

    #
    # Initializes a new instance of the MaxImageSize class.
    #
    def initialize
      super()
      @max_width = nil
      @max_height = nil
      @unit = nil
      @type = ImageSizeType::Max
    end

    #
    # Returns a JSON representation of the MaxImageSize object.
    #
    # @return [String] JSON string representing the MaxImageSize object.
    #
    def to_json(_options = {})
      json_array = {}
      json_array['type'] = 'max'
      json_array['maxWidth'] = @max_width
      json_array['maxHeight'] = @max_height
      json_array['unit'] = @unit
      JSON.pretty_generate(json_array)
    end
  end
end
