require_relative "TiffColorFormat"
require_relative "ColorFormatType"

module DynamicPDFApi
  #
  # Represents indexed color format for TIFF.
  #
  class TiffIndexedColorFormat < TiffColorFormat
    attr_accessor :quantization_algorithm  # Gets or sets the QuantizationAlgorithm for TIFF.
    attr_accessor :dithering_percent  # Gets or sets the dithering percentage for TIFF.
    attr_accessor :dithering_algorithm  # Gets or sets the DitheringAlgorithm for TIFF.

    #
    # Initializes a new instance of the TiffIndexedColorFormat class with indexed color format type.
    #
    def initialize
      super(ColorFormatType::Indexed)
      @quantization_algorithm = nil
      @dithering_percent = nil
      @dithering_algorithm = nil
    end

    #
    # Returns a JSON representation of the TiffIndexedColorFormat object.
    #
    # @return [String] JSON string representing the TiffIndexedColorFormat object.
    #
    def to_json(_options = {})
      json_array = {}
      json_array['quantizationAlgorithm'] = @quantization_algorithm
      json_array['ditheringPercent'] = @dithering_percent
      json_array['ditheringAlgorithm'] = @dithering_algorithm

      JSON.pretty_generate(json_array)
    end
  end
end
