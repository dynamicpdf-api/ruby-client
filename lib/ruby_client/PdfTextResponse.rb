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
    def initialize(json_content)
      @content = JSON.pretty_generate(json_content).gsub('\\\\', '\\').gsub('\"', '"').gsub('\\\r', '\r').gsub('\\\n', '\n').gsub(
        '\\\t', '\t'
      )
      @content = @content[1..@content.length - 2]

      super(json_content)
    end

    #
    # Gets the collection of PdfContent.
    #
    attr_accessor :content
  end
end
