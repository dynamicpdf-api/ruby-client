module DynamicPDFApi
  require_relative 'PngColorFormat'
  require_relative 'ColorFormatType'

  #
  # Represents indexed color format for PNG.
  #
  class PngIndexedColorFormat < PngColorFormat
    attr_accessor :quantization_algorithm  # Gets or sets the QuantizationAlgorithm for PNG.
    attr_accessor :dithering_percent       # Gets or sets the dithering percentage for PNG.
    attr_accessor :dithering_algorithm     # Gets or sets the DitheringAlgorithm for PNG.

    #
    # Initializes a new instance of the PngIndexedColorFormat class with indexed color format type.
    #
    def initialize
      super(ColorFormatType::Indexed)
      @quantization_algorithm = nil
      @dithering_percent = nil
      @dithering_algorithm = nil
    end

    def to_json(_options = {})
      json_array = {}
      json_array['quantizationAlgorithm'] = @quantization_algorithm
      json_array['ditheringPercent'] = @dithering_percent
      json_array['ditheringAlgorithm'] = @dithering_algorithm
      JSON.pretty_generate(json_array)
    end

  end
end
