module DynamicPDFApi
  require_relative 'JsonResponse'

  #
  # Represents the pdf information response.
  #
  class PdfInfoResponse < JsonResponse
    #
    # Initializes a new instance of the PdfInfoResponse class.
    #
    # @param json_content [String] The json of pdf information.
    #
    def initialize(json_content = nil)
      @content = []
      return if json_content.nil?

      super(json_content)
      @content = JSON.pretty_generate(json_content).gsub('\\\\', '\\').gsub('\"', '"').gsub('\\\r', '\r').gsub('\\\n', '\n').gsub('\\\t', '\t')
      @content = @content[1..@content.length - 2]
    end

    #
    # Gets the pdf information content.
    #
    attr_accessor :content
  end
end
