module DynamicPDFApi
  require_relative 'Response'

  #
  # Represents the pdf response.
  #
  class PdfResponse < Response
    #
    # Gets the content od pdf.
    #
    attr_accessor :content

    #
    # Initializes a new instance of the PdfResponse class.
    #
    # @param pdf_content [String] The byte array of pdf content.
    #
    def initialize(pdf_content = nil)
      super()
      @content = pdf_content
    end
  end
end
