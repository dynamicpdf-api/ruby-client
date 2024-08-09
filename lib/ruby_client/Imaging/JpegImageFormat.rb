module DynamicPDFApi
  require_relative "ImageFormat"
  require_relative "ImageFormatType"

  #
  # Represents JPEG image format with quality.
  #
  class JpegImageFormat < ImageFormat
    attr_accessor :quality  # Gets or sets the quality of the JPEG image.

    #
    # Initializes a new instance of the JpegImageFormat class.
    #
    def initialize
      super(ImageFormatType::JPEG)
      @quality = nil
    end

    #
    # Returns a JSON representation of the JpegImageFormat object.
    #
    # @return [String] JSON string representing the JpegImageFormat object.
    #
    def to_json(_options = {})
      json_array = {}
      json_array['type'] = 'jpeg'
      json_array['quality'] = @quality
      JSON.pretty_generate(json_array)
    end
  end
end
