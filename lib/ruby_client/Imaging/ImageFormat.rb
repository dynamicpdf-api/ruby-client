module DynamicPDFApi
  #
  # Base class for image formats.
  #
  class ImageFormat
    #
    # Gets the image format type.
    #
    attr_reader :type

    #
    # Initializes a new instance of ImageFormat with the specified type.
    #
    # @param type [Symbol] The type of the image format.
    #
    def initialize(type)
      @type = type
    end

    #
    # Returns a JSON representation of the ImageFormat object.
    #
    # @return [String] JSON string representing the ImageFormat object.
    #
    def to_json(_options = {})
      json_array = {}
      json_array['type'] = @type
      JSON.pretty_generate(json_array)
    end
  end
end
