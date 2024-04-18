module DynamicPDFApi
  require_relative "Resource"
  require_relative "ResourceType"
  require_relative "EndPointException"

  #
  # Represents an image resource used to create an ImageInput object to create PDF from images.
  #
  class ImageResource < Resource
    #
    # Initializes a new instance of the ImageResource class.
    #
    # @param file [String]|[Stream] The image file path or the byte  of the image file or the stream of the image file.
    # @param resource_name [String] The name of the resource.
    #
    def initialize(file, resource_name = nil)
      @_type = ResourceType::IMAGE
      @_mime_type = nil
      super(file, resource_name)
    end

    def _file_extension
      @file_header = @data[0, 16]
      @file_header = @file_header.bytes

      if ImageResource.is_png_image(@file_header)
        @_mime_type = "image/png"
        ".png"
      elsif ImageResource.is_jpeg_image(@file_header)
        @_mime_type = "image/jpeg"
        ".jpeg"
      elsif ImageResource.is_gif_image(@file_header)
        @_mime_type = "image/gif"
        ".gif"
      elsif ImageResource.is_tiff_image(@file_header)
        @_mime_type = "image/tiff"
        ".tiff"
      elsif ImageResource.is_jpeg2000_image(@file_header)
        @_mime_type = "image/jpeg"
        ".jpeg"
      elsif ImageResource.is_valid_bitmap_image(@file_header)
        @_mime_type = "image/bmp"
        ".bmp"
      else
        raise "Not supported image type or invalid image."
      end
    end

    def self.is_jpeg2000_image(header)
      (header[0] == 0x00 && header[1] == 0x00 && header[2] == 0x00 && header[3] == 0x0C && header[4] == 0x6A &&
       header[5] == 0x50 && (header[6] == 0x1A || header[6] == 0x20) && (header[7] == 0x1A || header[7] == 0x20) &&
       header[8] == 0x0D && header[9] == 0x0A && header[10] == 0x87 && header[11] == 0x0A) ||
        (header[0] == 0xFF && header[1] == 0x4F && header[2] == 0xFF && header[3] == 0x51 && header[6] == 0x00 && header[7] == 0x00)
    end

    def self.is_png_image(header)
      header[0] == 0x89 && header[1] == 0x50 && header[2] == 0x4E && header[3] == 0x47 &&
        header[4] == 0x0D && header[5] == 0x0A && header[6] == 0x1A && header[7] == 0x0A
    end

    def self.is_tiff_image(header)
      (header[0] == 0x49 && header[1] == 0x49 && header[2] == 0x2A && header[3] == 0x00) ||
        (header[0] == 0x4D && header[1] == 0x4D && header[2] == 0x00 && header[3] == 0x2A)
    end

    def self.is_gif_image(header)
      header[0] == 0x47 && header[1] == 0x49 && header[2] == 0x46 && header[3] == 0x38 && (header[4] == 0x37 ||
                                                                                           header[4] == 0x39) && header[5] == 0x61
    end

    def self.is_jpeg_image(header)
      header[0] == 0xFF && header[1] == 0xD8 && header[2] == 0xFF
    end

    def self.is_valid_bitmap_image(header)
      header[0] == 0x42 && header[1] == 0x4D
    end

    def to_json(_options = {})
      json_array = {}
      json_array["type"] = "image"
      json_array["align"] = 1
      json_array["vAlign"] = 1

      json_array["resourceName"] = @resource_name
      JSON.pretty_generate(json_array)
    end
  end
end
