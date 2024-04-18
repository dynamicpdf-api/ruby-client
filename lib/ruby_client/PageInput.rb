module DynamicPDFApi
  require_relative "InputType"

  #
  # Represents a page input.
  #
  class PageInput < Input
    DefaultPageHeight = 792.0.freeze
    DefaultPagewidth = 612.0.freeze
    #
    # Initializes a new instance of the PageInput class.
    #
    # @param page_width [float] The width of the page.
    # @param page_height [float] The height of the page.
    #
    def initialize(page_width = nil, page_height = nil)
      @page_size = nil
      @page_orientation = nil
      super()
      @_resources = []
      @elements = []
      @_type = InputType::PAGE
      @page_width = page_width
      @page_height = page_height
    end

    #
    # Initializes a new instance of the PageInput class.
    #
    # @param size [string] The size of the page.
    # @param orientation [string] The orientation of the page.
    # @param margins [float] The margins of the page.
    def PageInputCreate(size = PageSize.Letter, orientation = PageOrientation.Portrait, margins = nil)
      @page_size = size
      @page_orientation = orientation

      if (margins != nil)
        @top_margin = margins
        @bottom_margin = margins
        @right_margin = margins
        @left_margin = margins
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

      @output_size = UnitConverter.GetPaperSize(value)

      if (PageOrientation == PageOrientation.Portrait)
        @page_height = @output_size.larger
        @page_width = @output_size.smaller
      else
        @page_height = @output_size.smaller
        @page_width = @output_size.larger
      end
    end

    #
    # Gets or sets page orientation.
    #
    def page_orientation=(value)
      @page_orientation = value

      if (@width > @page_height)
        @smaller = @page_height
        @larger_Width = @page_width
      else
        @smaller = @page_width
        @larger_width = @page_height
      end

      if (page_orientation == PageOrientation.Portrait)
        @page_height = @larger_width
        @page_width = @smaller
      else
        @page_height = @smaller
        @page_width = @larger_width
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

      json_array["elements"] = json_element

      #---------------------------------------------------
      json_array["templateId"] = @_template_id unless @_template_id.nil?

      json_array["resourceName"] = @resource_name unless @resource_name.nil?

      json_array["id"] = @id unless @id.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
