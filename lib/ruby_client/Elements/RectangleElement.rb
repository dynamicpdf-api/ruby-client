module DynamicPDFApi
  require_relative 'Element'
  require_relative 'ElementPlacement'
  require_relative 'ElementType'

  #
  # Represents a rectangle page element.
  #
  # This class can be used to place rectangles of any size or color on a page.
  #
  class RectangleElement < Element
    #
    # Initializes a new instance of the RectangleElement class.
    #
    # @param placement [String] The placement of the rectangle on the page.
    # @param width [float] Width of the rectangle.
    # @param height [float] Height of the rectangle.
    #
    def initialize(width, height,placement= ElementPlacement::TOP_LEFT)
      super()
      @_type = ElementType::RECTANGLE
      @border_width = nil
      @corner_radius = nil
      @border_style = nil
      @border_color = nil
      @fill_color = nil

      @placement = placement
      @width = width
      @height = height
    end

    #
    # Gets or sets the width of the rectangle.
    #
    attr_accessor :width

    #
    # Gets or sets the height of the rectangle.
    #
    attr_accessor :height

    #
    # Gets or sets the border width of the rectangle.
    #
    # To force the borders not to appear set the border width to any value 0 or less.
    #
    attr_accessor :border_width

    #
    # Gets or sets the corner radius of the rectangle.
    #
    attr_accessor :corner_radius
    #
    # Gets or sets the LineStyle object used to specify the border style of the rectangle.
    #
    attr_accessor :border_style
    #
    # Gets or sets the Color object to use for the border of the rectangle.
    #
    attr_accessor :border_color
    #
    # Gets or sets the Color object to use for the fill of the rectangle.
    #
    # To force no color to appear in the rectangle (only borders) set the fill color to nil (Nothing in Visual
    # Basic).
    #
    attr_accessor :fill_color

    def to_json(_options = {})
      # 'width':100.0,'height':50.0,'cornerRadius':0.0,'placement':'topCenter','xOffset':0.0,'yOffset':0.0
      json_array = {}
      json_array['type'] = 'rectangle'

      json_array['width'] = @width unless @width.nil?

      json_array['height'] = @height unless @height.nil?

      json_array['borderWidth'] = @border_width unless @border_width.nil?

      json_array['cornerRadius'] = @corner_radius unless @corner_radius.nil?

      json_array['fillColor'] = @fill_color._color_string if !@fill_color.nil? && !@fill_color._color_string.nil?

      if !@border_style.nil? && !@border_style._line_style_string.nil?
        json_array['borderStyle'] = @border_style._line_style_string
      end

      if !@border_color.nil? && !@border_color._color_string.nil?
        json_array['borderColor'] =
          @border_color._color_string
      end

      # ---------------------------------

      json_array['placement'] = @placement unless @placement.nil?

      json_array['xOffset'] = @x_offset unless @x_offset.nil?

      json_array['yOffset'] = @y_offset unless @y_offset.nil?

      json_array['evenPages'] = @even_pages unless @even_pages.nil?

      json_array['oddPages'] = @odd_pages unless @odd_pages.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
