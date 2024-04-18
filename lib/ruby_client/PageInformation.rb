module DynamicPDFApi
  #
  # Represents a page information.
  #
  class PageInformation
    def initialize
      @page_number = nil
      @width = nil
      @height = nil
    end

    #
    # Gets or sets the page number.
    #
    attr_accessor :page_number

    #
    # Gets or sets the width of the page.
    #
    attr_accessor :width

    #
    # Gets or sets the height of the page.
    #
    attr_accessor :height
  end
end
