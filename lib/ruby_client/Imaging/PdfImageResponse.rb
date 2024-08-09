module DynamicPDFApi
  require_relative '..\Response'

  #
  # Represents a response from the rasterizer operation.
  #
  class PdfImageResponse < Response

    attr_accessor :image_format

    attr_accessor :images

    attr_accessor :content_type

    attr_accessor :horizontal_dpi

    attr_accessor :vertical_dpi

    #
    # Initializes a new instance of the RasterizerResponse class.
    #
    def initialize
      @image_format = nil
      @images = []
    end
  end

  class Image
    attr_accessor :page_number

    attr_accessor :data

    attr_accessor :billed_pages

    attr_accessor :width

    attr_accessor :height

  end
end
