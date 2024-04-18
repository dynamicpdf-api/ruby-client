module DynamicPDFApi
  require_relative 'Input'
  require_relative 'ImageResource'
  require_relative 'InputType'
  require_relative 'Align'
  require_relative 'VAlign'

  #
  # Represents an image input.
  #
  class ImageInput < Input
    #
    # Initializes a new instance of the ImageInput class.
    #
    # @param resource [String]|[ImageResource] The image file path present in cloud resource manager or the ImageResource object to create ImageInput.
    #
    def initialize(resource)
      @_type = InputType::IMAGE
      @scale_x = nil
      @scale_y = nil
      @top_margin = nil
      @left_margin = nil
      @bottom_margin = nil
      @right_margin = nil
      @page_width = nil
      @page_height = nil
      @expand_to_fit = nil
      @shrink_to_fit = nil
      @align = Align::CENTER
      @v_align = VAlign::CENTER
      @start_page = nil
      @page_count = nil
      super(resource)
    end

    attr_accessor :_type

    #
    # Gets or sets the scaleX of the image.
    #
    attr_accessor :scale_x

    #
    # Gets or sets the scaleY of the image.
    #
    attr_accessor :scale_y
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

    #
    # Gets or sets a boolean indicating whether to expand the image.
    #
    attr_accessor :expand_to_fit

    #
    # Gets or sets a boolean indicating whether to shrink the image.
    #
    attr_accessor :shrink_to_fit

    #
    # Gets or sets the horizontal alignment of the image.
    #
    attr_accessor :align

    #
    # Gets or sets the vertical alignment of the image.
    #
    attr_accessor :v_align

    #
    # Gets or sets the start page.
    #
    attr_accessor :start_page

    #
    # Gets or sets the page count.
    #
    attr_accessor :page_count

    def to_json(_options = {})
      json_array = {}

      json_array['type'] = 'image'

      json_array['scaleX'] = @scale_x unless @scale_x.nil?

      json_array['scaleY'] = @scale_y unless @scale_y.nil?

      json_array['topMargin'] = @top_margin unless @top_margin.nil?

      json_array['leftMargin'] = @left_margin unless @left_margin.nil?

      json_array['bottomMargin'] = @bottom_margin unless @bottom_margin.nil?

      json_array['rightMargin'] = @right_margin unless @right_margin.nil?

      json_array['pageWidth'] = @page_width unless @page_width.nil?

      json_array['pageHeight'] = @page_height unless @page_height.nil?

      json_array['expandToFit'] = @expand_to_fit unless @expand_to_fit.nil?

      json_array['shrinkToFit'] = @shrink_to_fit unless @shrink_to_fit.nil?

      json_array['align'] = @align unless @align.nil?

      json_array['vAlign'] = @a_align unless @a_align.nil?

      json_array['startPage'] = @start_page unless @start_page.nil?

      json_array['pageCount'] = @page_count unless @page_count.nil?

      #---------------------------------------------------
      json_array['templateId'] = @_template_id unless @_template_id.nil?

      json_array['resourceName'] = @resource_name unless @resource_name.nil?

      json_array['id'] = @id unless @id.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
