module DynamicPDFApi
  require_relative 'Response'

  #
  # Represents the xml response.
  #
  class XmlResponse < Response
    #
    # Initializes a new instance of the XmlResponse class.
    #
    # @param xml_content [String]  The xml content of the response.
    #
    def initialize(xml_content = nil)
      super()
      @content = xml_content
    end

    #
    # Gets the xml content.
    #
    attr_accessor :content
  end
end
