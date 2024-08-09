module DynamicPDFApi
  require_relative "Action"
  require_relative "OutlineStyle"
  # require_relative 'OutlineList'

  autoload :OutlineList, File.join(File.dirname(__FILE__), *%w[OutlineList.rb])

  #
  # Represents an outline.
  #
  class Outline
    #
    # Initializes a new instance of the Outline class.
    #
    # @param input [PdfInput] The input of type PdfInput .
    # @param action [Action] Action of the outline.
    #
    def initialize(input, action = nil)
      @_color_name = nil
      @text = nil
      @style = nil
      @expanded = nil
      @children = nil
      @action = nil
      @_from_input_id = nil
      @color = nil

      @children = OutlineList.new
      if input.is_a?(String)
        @text = input
        @action = action
      else
        @_from_input_id = input.id
      end
    end

    attr_accessor :_color_name, :_from_input_id

    #
    # Gets or sets the text of the outline.
    #
    attr_accessor :text

    #
    # Gets or sets the style of the outline.
    #
    attr_accessor :style

    #
    # Gets or sets a value specifying if the outline is expanded.
    #
    attr_accessor :expanded

    #
    # Gets or sets a collection of child outlines.
    #
    attr_accessor :children
    #
    # Gets or sets the Action of the outline.
    #
    attr_accessor :action

    #
    # Gets or sets the color of the outline.
    #
    attr_accessor :color

    #
    # Gets collection of child outlines.
    #
    # @return OutlineList Collection of child outlines.
    #
    def _get_children
      if (@children != nil)
        @children&._out_lines
      else
        nil
      end
    end

    def to_json(_options = {})
      json_array = {}

      json_array["type"] = "Outline"

      unless @color.nil?
        color_string = @color._color_string
        json_array['color'] = color_string unless color_string.nil?
      end

      json_array["text"] = @text unless @text.nil?

      json_array["linkTo"] = @action unless @action.nil?

      json_array["style"] = @style unless @style.nil?

      json_array["expanded"] = @expanded unless @expanded.nil?

      if !@children.nil? && !@children._out_lines.empty?
        children_array = []
        (0..(@children._out_lines.length - 1)).each do |i|
          children_array << @children._out_lines[i] unless @children._out_lines[i].nil?
        end
        json_array["children"] = children_array
      end
      json_array["fromInputID"] = @_from_input_id unless @_from_input_id.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
