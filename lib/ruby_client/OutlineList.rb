module DynamicPDFApi
  require_relative 'PageZoom'
  require_relative 'GoToAction'
  require_relative 'Outline'
  require_relative 'PdfInput'

  class OutlineList
    def initialize
      @_out_lines = []
    end

    #
    # Adds an Outline object to the outline list.
    #
    # @param text [String] Text of the outline.
    # @param input [String]|Input URL the action launches or any of the ImageInput, DlexInput, PdfInput or PageInput objects to create PDF or nil.
    # @param page_offset [int] Page number to navigate.
    # @param page_zoom [PageZoom] PageZoom to display the destination.
    #
    # @return Outline The Outline object that is created.
    #
    def add(text, input = nil, page_offset = 0, page_zoom = PageZoom::FIT_PAGE)
      if input.nil?
        out_line = Outline.new(text)
        @_out_lines << out_line
        out_line
      elsif input.is_a?(String)
        out_line = Outline.new(text, UrlAction.new(input))
        @_out_lines << out_line
        out_line
      elsif input.is_a?(Object)
        link_to = GoToAction.new(input)
        link_to.page_offset = page_offset
        link_to.page_zoom = page_zoom
        out_line = Outline.new(text, link_to)
        @_out_lines << out_line
        out_line
      end
    end

    def add_pdf_outlines(pdf_input)
      @_out_lines << Outline.new(pdf_input)
    end

    attr_accessor :_out_lines

    def to_json(_options = {})
      json_array = []

      (0..(@_out_lines.length - 1)).each do |i|
        json_array << @_out_lines[i] unless @_out_lines[i].nil?
      end

      JSON.pretty_generate(json_array)
    end
  end
end
