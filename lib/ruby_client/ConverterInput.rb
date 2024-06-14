module DynamicPDFApi
require_relative 'Input'
  #
  # Represents the base class for inputs.
  #
  class ConverterInput < Input
    def initialize(resource, size, orientation, margins)
      super(resource)

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
    end

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
    # Gets or sets the page width.
    #
    attr_accessor :page_width

    #
    # Gets or sets the page height.
    #
    attr_accessor :page_height

    #attr_accessor :page_size

    attr_accessor :_smaller, :_larger
    #
    # Gets or sets the page size.
    #
    def page_size=(value)
      @page_size = value

      output_size = UnitConverter.get_paper_size(value)

      @_larger = output_size.larger
      @_smaller = output_size.smaller

      if @page_orientation == PageOrientation::LANDSCAPE
        @page_height = @_smaller
        @page_width = @_larger
      else
        @page_height = @_larger
        @page_width = @_smaller
      end
    end

    #
    # Gets or sets page orientation.
    #
    def page_orientation=(value)
      @page_orientation = value

      if(@page_width != nil && @page_height != nil)
        if @page_width > @page_height
          @_smaller = @page_height
          @_larger = @page_width
        else
          @_smaller = @page_width
          @_larger = @page_height
        end

        if @page_orientation == PageOrientation::LANDSCAPE
          @page_height = @_smaller
          @page_width = @_larger
        else
          @page_height = @_larger
          @page_width = @_smaller
        end
      end
    end

    def to_json(_options = {})
      JSON.pretty_generate({})
    end
  end
end
