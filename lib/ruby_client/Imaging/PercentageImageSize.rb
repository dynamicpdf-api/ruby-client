module DynamicPDFApi
  require_relative "ImageSize"
  require_relative "ImageSizeType"

  #
  # Represents an image size based on percentage scaling.
  #
  class PercentageImageSize < ImageSize
    attr_accessor :horizontal_percentage  # Gets or sets the horizontal scaling percentage.
    attr_accessor :vertical_percentage  # Gets or sets the vertical scaling percentage.

    #
    # Initializes a new instance of the PercentageImageSize class.
    #
    def initialize
      super()
      @horizontal_percentage = nil
      @vertical_percentage = nil
      @type = ImageSizeType::Percentage
    end

    #
    # Returns a JSON representation of the PercentageImageSize object.
    #
    # @return [String] JSON string representing the PercentageImageSize object.
    #
    def to_json(_options = {})
      json_array = {}
      json_array['type'] = 'percentage'
      json_array['horizontalPercentage'] = @horizontal_percentage
      json_array['verticalPercentage'] = @vertical_percentage
      JSON.pretty_generate(json_array)
    end
  end
end
