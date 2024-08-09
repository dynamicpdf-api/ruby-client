require_relative "ImageFormat"
require_relative "ImageFormatType"

module DynamicPDFApi
  #
  # Represents TIFF image format with color format.
  #
  class TiffImageFormat < ImageFormat
    attr_accessor :multi_page  # Gets or sets a value indicating whether the TIFF image format supports multiple pages.
    attr_accessor :color_format  # Gets or sets the color format for TIFF, TiffColorFormat.

    #
    # Initializes a new instance of the TiffImageFormat class.
    #
    def initialize
      super(ImageFormatType::TIFF)
      @multi_page = false
      @color_format = nil
    end

    #
    # Returns a JSON representation of the TiffImageFormat object.
    #
    # @return [String] JSON string representing the TiffImageFormat object.
    #
    def to_json(_options = {})
      json_array = {}
      json_array['multiPage'] = @multi_page
      json_array['colorFormat'] = @color_format  # Assuming TiffColorFormat has implemented to_json method.

      JSON.pretty_generate(json_array)
    end
  end
end
