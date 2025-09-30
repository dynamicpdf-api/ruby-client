module DynamicPDFApi

  require_relative 'AdditionalResourceType'

  class AdditionalResource < Resource
    def initialize(resource, resource_name, resource_type=nil)
      @default_page_height = 792.0
      @default_page_width = 612.0
      @type = ResourceType::LAYOUT_DATA

      if (resource.is_a?(Array)) == true
        super(resource, resource_name)
        @type = resource_type
      else
        super(resource, resource_name)
        @type = get_resource_type(resource)
      end
    end

    def get_resource_type(resourcePath)
      @type = ResourceType::PDF
      file_extension = File.extname(resourcePath).downcase
      case (file_extension)

      when ".pdf"
        @type = ResourceType::PDF

      when ".dlex"
        @type = ResourceType::DLEX

      when ".json"
        @type = ResourceType::LAYOUT_DATA

      when ".ttf"
      when ".otf"
        @type = ResourceType::FONT

      when ".tiff"
      when ".tif"
      when ".png"
      when ".gif"
      when ".jpeg"
      when ".jpg"
      when ".bmp"
        @type = ResourceType::IMAGE

      when ".html"
        @type = ResourceType::HTML

      end
      @type
    end

    def file_extension=(value)
      @file_extension = value
      case (@type)

      when ResourceType::IMAGE
        @file_header = @data[0, 16]
        @file_header = @file_header.bytes
        if (ImageResource.is_png_image(@file_header))
          @_mime_type = "image/png"
          ".png"
        elsif (ImageResource.is_jpeg_image(@file_header))
          @_mime_type = "image/jpeg"
          ".jpeg"
        elsif (ImageResource.is_gif_image(@file_header))
          @_mime_type = "image/gif"
          ".gif"
        elsif (ImageResource.is_tiff_image(@file_header))
          @_mime_type = "image/tiff"
          ".tiff"
        elsif (ImageResource.is_jpeg2000_image(@file_header))
          @_mime_type = "image/jpeg"
          ".jpeg"
        elsif (ImageResource.is_valid_bitmap_image(@file_header))
          @_mime_type = "image/bmp"
          ".bmp"
        else
          raise "Not supported image type or invalid image."
        end
      when ResourceType::PDF
        @_mime_type = "application/pdf"
        ".pdf"
      when ResourceType::LAYOUT_DATA
        @_mime_type = "application/json"
        ".json"
      when ResourceType::DLEX
        @_mime_type = "application/xml"
        ".dlex"
      when ResourceType::FONT
        if (Data[0] == 0x4f && Data[1] == 0x54 && Data[2] == 0x54 && Data[3] == 0x4f)
          @_mime_type = "font/otf"
          ".otf"
        elsif (Data[0] == 0x00 && Data[1] == 0x01 && Data[2] == 0x00 && Data[3] == 0x00)
          @_mime_type = "font/ttf"
          ".ttf"
        else
          raise "Unsupported font"
        end
      when ResourceType::Html
        @_mime_type = "text/html"
        ".html"
      end
      nil
    end

    attr_accessor :type
    attr_accessor :_mime_type
    attr_accessor :default_page_height
    attr_accessor :default_page_width
  end
end
