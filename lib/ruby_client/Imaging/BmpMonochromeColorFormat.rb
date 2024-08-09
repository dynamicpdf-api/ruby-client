module DynamicPDFApi
  require_relative 'BmpColorFormat'
  require_relative 'ColorFormatType'


  #
  # Represents monochrome color format for BMP.
  #
  class BmpMonochromeColorFormat < BmpColorFormat
    attr_accessor :black_threshold  # Gets or sets the black threshold for monochrome BMP, ranges from 0-255.
    attr_accessor :dithering_percent  # Gets or sets the dithering percentage for BMP.
    attr_accessor :dithering_algorithm  # Gets or sets the dithering algorithm for BMP.

    #
    # Creates object for monochrome color format for BMP image format.
    #
    def initialize
      super(ColorFormatType::Monochrome)
      @black_threshold = nil
      @dithering_percent = nil
      @dithering_algorithm = nil
    end

    #
    # Returns a JSON representation of the BmpMonochromeColorFormat object.
    #
    # @return [String] JSON string representing the BmpMonochromeColorFormat object.
    #
    def to_json(_options = {})
      json_array = {}
      json_array['blackThreshold'] = @black_threshold
      json_array['ditheringPercent'] = @dithering_percent
      json_array['ditheringAlgorithm'] = @dithering_algorithm
      JSON.pretty_generate(json_array)
    end
  end
end
