module DynamicPDFApi
  require_relative "InputType"

  #
  # Represents a page input.
  #
  class PageInput < Input

    #
    # Initializes a new instance of the PageInput class.
    #
    # @param size [String] | [Float] The size of the page or The width of the page.
    # @param orientation [String] | [Float] The orientation of the page or The height of the page.
    # @param margins [Float] The margins of the page.
    #
    def initialize(size = nil, orientation = nil, margins = nil)
      super()
      @_resources = []
      @elements = []
      @_type = InputType::PAGE

      if (size.is_a?(String) && orientation.is_a?(String))
        if (size != nil)
          self.page_size = size
        end
        if (orientation != nil)
          self.page_orientation = orientation
        end

        if (margins != nil)
          @top_margin = margins
          @bottom_margin = margins
          @right_margin = margins
          @left_margin = margins
        end
      elsif (size.is_a?(Float) || size.is_a?(Integer))
          @page_width = size
          @page_height = orientation
      end
    end

    attr_accessor :_type, :elements

    #
    # Gets or sets the width of the page.
    #
    attr_accessor :page_width

    #
    # Gets or sets the height of the page.
    #
    attr_accessor :page_height

    #
    # Gets or sets the top margin.
    #
    attr_accessor :top_margin

    #
    # Gets or sets the left margin.
    #
    attr_accessor :left_margin

    #
    # Gets or sets the bottom margin.
    #
    attr_accessor :bottom_margin

    #
    # Gets or sets the right margin.
    #
    attr_accessor :right_margin

    #
    # Gets or sets the Page size.
    #
    def page_size=(value)
      @page_size = value

      @output_size = UnitConverter.get_paper_size(value)

      if @page_orientation == PageOrientation::LANDSCAPE
        @page_height = @output_size.smaller
        @page_width = @output_size.larger
      else
        @page_height = @output_size.larger
        @page_width = @output_size.smaller
      end
    end

    #
    # Gets or sets page orientation.
    #
    def page_orientation=(value)
      @page_orientation = value

      if(@page_width != nil && @page_height != nil)
        if @page_width > @page_height
          @smaller = @page_height
          @larger_Width = @page_width
        else
          @smaller = @page_width
          @larger_width = @page_height
        end

        if @page_orientation == PageOrientation::LANDSCAPE
          @page_height = @smaller
          @page_width = @larger_width
        else
          @page_height = @larger_width
          @page_width = @smaller
        end
      end
    end
    #
    # Gets or sets the elements of the page.
    #
    # @return array Elements of the page.
    #
    def get_elements
      @elements
    end

    def to_json(_options = {})
      json_element = []
      @elements.each do |element|
        json_element << element unless element.nil?
      end

      json_array = {}

      json_array["type"] = "page"

      json_array["pageWidth"] = @page_width unless @page_width.nil?

      json_array["pageHeight"] = @page_height unless @page_height.nil?

      json_array["topMargin"] = @top_margin unless @top_margin.nil?

      json_array["leftMargin"] = @left_margin unless @left_margin.nil?

      json_array["bottomMargin"] = @bottom_margin unless @bottom_margin.nil?

      json_array["rightMargin"] = @right_margin unless @right_margin.nil?

      json_array["elements"] = json_element

      #---------------------------------------------------
      json_array["templateId"] = @_template_id unless @_template_id.nil?

      json_array["resourceName"] = @resource_name unless @resource_name.nil?

      json_array["id"] = @id unless @id.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
