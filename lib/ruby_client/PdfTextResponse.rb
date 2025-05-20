module DynamicPDFApi
  require_relative 'JsonResponse'

  #
  # Represents the pdf text response.
  #
  class PdfTextResponse < JsonResponse
    #
    # Initializes a new instance of the PdfResponse class.
    #
    # @param json_content [String] The json content
    #
    def initialize(json_content = nil)

      @content = nil
      super(json_content) unless json_content.nil?

      @content = JSON.parse(json_content)

    end

    #
    # Gets the collection of PdfContent.
    #
    attr_accessor :content
  end
end
