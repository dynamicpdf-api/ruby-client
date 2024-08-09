module DynamicPDFApi
  #
  # Base class for image size types.
  #
  class ImageSize
    attr_accessor :type  # Type of the image size.

    #
    # Initializes a new instance of the ImageSize class.
    #
    def initialize
      @type = nil
    end

    #
    # Returns a JSON representation of the ImageSize object.
    #
    # @return [String] JSON string representing the ImageSize object.
    #
    def to_json(_options = {})
      json_array = {}
      json_array['type'] = @type
      JSON.pretty_generate(json_array)
    end
  end
end
