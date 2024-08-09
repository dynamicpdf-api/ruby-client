module DynamicPDFApi
  require_relative "ImageFormatType"
  require_relative "ImageFormat"

      # Represents GIF image format with dithering properties.
      #
      class GifImageFormat < ImageFormat
        attr_accessor :dithering_percent  # Gets or sets the dithering percentage.
        attr_accessor :dithering_algorithm  # Gets or sets the dithering algorithm.

        #
        # Initializes a new instance of the GifImageFormat class and sets the image format type to GIF.
        #
        def initialize
          super(ImageFormatType::GIF)
          @dithering_percent = nil
          @dithering_algorithm = nil
        end

        #
        # Returns a JSON representation of the GifImageFormat object.
        #
        # @return [String] JSON string representing the GifImageFormat object.
        #
        def to_json(_options = {})
          json_array = {}
          json_array['ditheringPercent'] = @dithering_percent
          json_array['ditheringAlgorithm'] = @dithering_algorithm
          json_array['type'] = 'gif'
          JSON.pretty_generate(json_array)
        end
      end
    end
