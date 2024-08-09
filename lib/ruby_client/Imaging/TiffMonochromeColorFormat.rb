require_relative "TiffColorFormat"
require_relative "ColorFormatType"

module DynamicPDFApi
  #
  # Represents monochrome color format for TIFF with black threshold and compression type.
  #
  class TiffMonochromeColorFormat < TiffColorFormat
    attr_accessor :black_threshold  # Gets or sets the black threshold for monochrome TIFF.
    attr_accessor :compression_type  # Gets or sets the CompressionType for monochrome TIFF.
    attr_accessor :dithering_percent  # Gets or sets the dithering percentage for TIFF.
    attr_accessor :dithering_algorithm  # Gets or sets the DitheringAlgorithm for TIFF.

    #
    # Initializes a new instance of the TiffMonochromeColorFormat class with monochrome color format type.
    #
    def initialize
      super(ColorFormatType::Monochrome)
      @black_threshold = nil
      @compression_type = nil
      @dithering_percent = nil
      @dithering_algorithm = nil
    end

    #
    # Returns a JSON representation of the TiffMonochromeColorFormat object.
    #
    # @return [String] JSON string representing the TiffMonochromeColorFormat object.
    #
    def to_json(_options = {})
      json_array = {}
      json_array['blackThreshold'] = @black_threshold
      json_array['compressionType'] = @compression_type
      json_array['ditheringPercent'] = @dithering_percent
      json_array['ditheringAlgorithm'] = @dithering_algorithm

      JSON.pretty_generate(json_array)
    end
  end
end
