module DynamicPDFApi
  require_relative 'ElementPlacement'

  #
  # Base class from which all page elements are derived.
  #
  class Element
    def initialize(value = nil, placement = nil, x_offset = 0, y_offset = 0)
      @even_pages = nil
      @odd_pages = nil
      @_text_font = nil
      @_resource = nil
      @_type = nil
      @_input_value = value
      @placement = placement
      @x_offset = x_offset
      @y_offset = y_offset
    end
    attr_accessor :_type, :_resource, :_input_value, :_text_font

    #
    # Gets and sets placement of the page element on the page.
    #
    attr_accessor :placement

    #
    # Gets or sets the X coordinate of the page element.
    #
    attr_accessor :x_offset

    #
    # Gets or sets the Y coordinate of the page element.
    #
    attr_accessor :y_offset

    #
    # Gets or sets the boolean value specifying whether the element should be added to even pages or not.
    #
    attr_accessor :even_pages

    #
    # Gets or sets the boolean value specifying whether the element should be added to odd pages or not.
    #
    attr_accessor :odd_pages
  end
end
