module DynamicPDFApi
  require_relative 'JsonResponse'

  #
  # Represents an image response.
  #
  class ImageResponse < JsonResponse
    #
    # Initializes a new instance of the ImageResponse class.
    #
    # @param json_content [String] The image content of the response.
    #
    def initialize(json_content = nil)
      @content = nil
      super(json_content) unless json_content.nil?
      @content = JSON.parse(json_content)
    end

    #
    # Gets or sets a collection of ImageInformation.
    #
    attr_accessor :content
  end
end
