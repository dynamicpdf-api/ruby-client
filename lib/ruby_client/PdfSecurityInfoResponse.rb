module DynamicPDFApi
  require_relative 'JsonResponse'
  require_relative 'PdfSecurityInfo'

  #
  # Represents the pdf security info response.
  #
  class PdfSecurityInfoResponse < JsonResponse
    #
    # Initializes a new instance of the PdfSecurityInfoResponse class.
    #
    # @param json_content [String] The json content
    #
    def initialize(json_content = nil)
      @content = nil
      super(json_content) unless json_content.nil?
      @content = PdfSecurityInfo.new(JSON.parse(json_content))

    end
    #   # @content.instance_variable_set(:@encryption_type, @content.encryption_type)
    # end

    #
    # Gets the collection of PdfContent.
    #
    attr_accessor :content
  end
end
