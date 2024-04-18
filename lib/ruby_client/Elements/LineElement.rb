module DynamicPDFApi
  require_relative "Element"
  require_relative "ElementPlacement"
  require_relative "ElementType"
  require_relative "../LineStyle"
  #
  # Represents a line page element.
  #
  # This class can be used to place lines of different length, width, color and patterns on a page.
  #
  class LineElement < Element
    #
    # Initializes a new instance of the LineElement class.
    #
    # @param placement [String] The placement of the line on the page.
    # @param x2_offset [float] X2 coordinate of the line.
    # @param y2_offset [float] Y2 coordinate of the line.
    #
    def initialize(x2_offset, y2_offset, placement = ElementPlacement::TOP_LEFT)
      super()
      @color = nil
      @width = nil
      @line_style = nil
      @_type = ElementType::LINE

      @placement = placement
      @x2_offset = x2_offset
      @y2_offset = y2_offset
    end

    #
    # Gets or sets the Color object to use for the line.
    #
    attr_accessor :color

    #
    # Gets or sets the X2 coordinate of the line.
    #
    attr_accessor :x2_offset

    #
    # Gets or sets the Y2 coordinate of the line.
    #
    attr_accessor :y2_offset

    #
    # Gets or sets the width of the line.
    #
    attr_accessor :width

    #
    # Gets or sets the LineStyle object to use for the style of the line.
    #
    attr_accessor :line_style

    def to_json(_options = {})
      json_array = {}
      json_array["type"] = "line"

      json_array["color"] = @color._color_string if !@color.nil? && !@color._color_string.nil?

      json_array["xOffset"] = @x_offset unless @x_offset.nil?

      json_array["yOffset"] = @y_offset unless @y_offset.nil?

      json_array["x2Offset"] = @x2_offset unless @x2_offset.nil?

      json_array["y2Offset"] = @y2_offset unless @y2_offset.nil?

      json_array["width"] = @width unless @width.nil?

      if !@line_style.nil? && !@line_style._line_style_string.nil?
        json_array["lineStyle"] =
          @line_style._line_style_string
      end

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
