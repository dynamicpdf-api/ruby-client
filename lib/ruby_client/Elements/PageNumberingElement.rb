module DynamicPDFApi
  require_relative 'Element'
  require_relative 'ElementType'
  require_relative '../Font'
  #
  # Represents a page numbering label page element.
  #
  # This class can be used to add page numbering to a PDF document. The following tokens can be used within
  # the text of a PageNumberingLabel. They will be replaced with the appropriate value when the PDF is output.
  # table All tokens except the /%/%PR/%/% token can also contain a numbering style specifier. The numbering
  # style specifier is placed in parenthesis after the token. table There should be no spaces within a token,
  # only the token and optional numbering style specifier. This token is invalid /%/%CP ( i )/%/% because
  # of the extra spaces.Here are some examples of valid tokens: margin-top: 0px
  #
  class PageNumberingElement < Element
    #
    # Initializes a new instance of the PageNumberingElement class.
    #
    # @param text [String] Text to display in the label.
    # @param placement [String] The placement of the page numbering element on the page.
    # @param x_offset [float] X coordinate of the label.
    # @param y_offset [float] Y coordinate of the label.
    #
    def initialize(text, placement= ElementPlacement::TOP_LEFT, x_offset = 0, y_offset = 0)
      @_font_name = nil
      @color = nil
      @font_size = nil

      @_text_font = nil
      @_resource = nil
      @_type = ElementType::PAGE_NUMBERING

      super(text, placement, x_offset, y_offset)
      @text = text
    end

    attr_accessor :_font_name

    #
    # Gets or sets the Color object to use for the text of the label.
    #
    attr_accessor :color

    #
    # Gets or sets the font size for the text of the label.
    #
    attr_accessor :font_size

    #
    # Gets or sets the text to display in the label.
    #
    attr_accessor :text

    #
    # Gets or sets the Font object to use for the text of the label.
    #
    def font(value)
      @_text_font = value
      @_font_name = @_text_font._name
      @_resource = @_text_font._resource
    end

    def to_json(_options = {})
      json_array = {}

      json_array['type'] = 'pageNumbering'

      json_array['font'] = @_font_name unless @_font_name.nil?

      json_array['text'] = @text

      json_array['color'] = @color._color_string if !@color.nil? && !@color._color_string.nil?

      json_array['fontSize'] = @font_size unless @font_size.nil?

      # ---------------------------------

      json_array['placement'] = @placement unless @placement.nil?

      json_array['xOffset'] = @x_offset unless @x_offset.nil?

      json_array['yOffset'] = @y_offset unless @y_offset.nil?

      json_array['evenPages'] = @even_pages unless @even_pages.nil?

      json_array['oddPages'] = @odd_pages unless @odd_pages.nil?

      JSON.pretty_generate(json_array).gsub('\\\\', '\\').gsub('\"', '"').gsub('\\\r', '\r').gsub('\\\n', '\n').gsub('\\\t', '\t')
    end
  end
end
