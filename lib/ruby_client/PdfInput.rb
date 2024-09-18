module DynamicPDFApi
  require_relative 'Input'
  require_relative 'InputType'
  require_relative 'MergeOptions'
  require_relative 'PdfResource'

  #
  # Represents a pdf input.
  #
  class PdfInput < Input
    #
    # Initializes a new instance of the PdfInput class.
    #
    # @param resource [String]|[PdfResource] The resource path in cloud resource manager or the resource of type PdfResource.
    # @param options [MergeOptions] The merge options for the pdf.
    #
    def initialize(resource, options = nil)
      @id = nil
      @_type = InputType::PDF
      @start_page = nil
      @page_count = nil
      @merge_options = options
      super(resource)
    end

    attr_accessor :_type

    #
    # Gets or sets the merge options MergeOptions.
    #
    attr_accessor :merge_options

    #
    # Gets or sets the start page.
    #
    attr_accessor :start_page

    #
    # Gets or sets the page count.
    #
    attr_accessor :page_count

    def to_json(_options = {})
      @template = get_template
      json_array = {}

      json_array['type'] = 'pdf'

      json_array['mergeOptions'] = @merge_options unless @merge_options.nil?

      json_array['startPage'] = @start_page unless @start_page.nil?

      json_array['pageCount'] = @page_count unless @page_count.nil?

      #---------------------------------------------------

      json_array['templateId'] = @_template_id unless @_template_id.nil?

      json_array['resourceName'] = @resource_name

      json_array['id'] = @id

      JSON.pretty_generate(json_array)
    end
  end
end
