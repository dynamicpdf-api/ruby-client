module DynamicPDFApi
  #
  # Represents the pdf content
  #
  class PdfContent
    def initialize
      @page_number = nil
      @text = nil
    end

    #
    # Gets or sets the page number.
    #
    attr_accessor :page_number

    #
    # Gets the text in the pdf.
    #
    attr_accessor :text
  end
end
