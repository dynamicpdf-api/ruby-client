module DynamicPDFApi
  require_relative "Element"
  require_relative "ElementType"

  #
  # Represents a text element.
  #
  # This class can be used to place text on a page.
  #
  class TextElement < Element
    #
    # Initializes a new instance of the TextElement class.
    #
    # @param value [String] Text to display in the text element.
    # @param placement [String] The placement of the text element on the page.
    # @param x_offset [float] X coordinate of the text element.
    # @param y_offset [float] Y coordinate of the text element.
    #
    def initialize(value, placement = ElementPlacement::TOP_LEFT, x_offset = 0, y_offset = 0)
      @_resource = nil
      @_text_font = nil
      @_font_name = nil

      @color = nil
      @font_size = nil
      @_type = ElementType::TEXT
      super(value, placement, x_offset, y_offset)
      @text = value
    end

    #
    # Gets or sets the Color object to use for the text of the text element.
    #
    attr_accessor :color

    #
    # Gets or sets the font size for the text of the text element.
    #
    attr_accessor :font_size

    #
    # Gets or sets the text to display in the text element.
    #
    attr_accessor :text

    #
    # Gets or sets the Font object used to specify the font of the text for the text element.
    #
    def font(value)
      @_text_font = value
      @_font_name = @_text_font._name
      @_resource = @_text_font._resource
    end

    def to_json(_options = {})
      json_array = {}

      json_array["type"] = "text"

      json_array["font"] = @_font_name unless @_font_name.nil?

      json_array["text"] = @text

      json_array["color"] = @color._color_string if !@color.nil? && !@color._color_string.nil?

      json_array["fontSize"] = @font_size unless @font_size.nil?

      # ---------------------------------

      json_array["placement"] = @placement unless @placement.nil?

      json_array["xOffset"] = @x_offset unless @x_offset.nil?

      json_array["yOffset"] = @y_offset unless @y_offset.nil?

      json_array["evenPages"] = @even_pages unless @even_pages.nil?

      json_array["oddPages"] = @odd_pages unless @odd_pages.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
