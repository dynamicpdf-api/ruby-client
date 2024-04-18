module DynamicPDFApi
  require_relative 'Action'
  require_relative 'Input'
  require_relative 'PageZoom'

  #
  # Represents a goto action in a PDF document that navigates to a specific page using page number and zoom
  # options.
  #
  class GoToAction < Action
    #
    # Initializes a new instance of the GoToAction class using an input to create the PDF, page number, and
    # a zoom option.
    #
    # @param input [Input] Any of the ImageInput, DlexInput, PdfInput or PageInput objects to create PDF.
    # @param page_offset [int] Page number to navigate.
    # @param page_zoom [String] PageZoom to display the destination.
    #
    def initialize(input, page_offset = 0, page_zoom = PageZoom::FIT_PAGE)
      super()
      @_input = input
      @_input_id = input.id
      @page_offset = page_offset
      @page_zoom = page_zoom
    end

    attr_accessor :_input, :_input_id

    #
    # Gets or sets page Offset.
    #
    attr_accessor :page_offset

    #
    # Gets or sets PageZoom to display the destination.
    #
    attr_accessor :page_zoom

    def to_json(_options = {})
      json_array = {}

      json_array['input'] = @_input unless @_input.nil?

      json_array['inputID'] = @_input_id unless @_input_id.nil?

      json_array['pageOffset'] = @page_offset unless @page_offset.nil?

      json_array['pageZoom'] = @page_zoom unless @page_zoom.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
