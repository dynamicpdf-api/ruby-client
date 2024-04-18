module DynamicPDFApi
  require_relative 'Resource'
  require_relative 'ResourceType'

  class FontResource < Resource
    def initialize(file, resource_name = nil)
      @_mime_type = nil
      @_type = ResourceType::FONT
      super(file, resource_name)
    end

    def _file_extension
      file_header = @data[0, 4]
      byte_array = file_header.bytes

      if byte_array[0] == 0x4f && byte_array[1] == 0x54 && byte_array[2] == 0x54 && byte_array[3] == 0x4f
        @_mime_type = 'font/otf'
        '.otf'
      elsif byte_array[0] == 0x00 && byte_array[1] == 0x01 && byte_array[2] == 0x00 && byte_array[3] == 0x00
        @_mime_type = 'font/ttf'
        '.ttf'
      else
        raise 'Unsupported font'
      end
    end

    def to_json(_options = {})
      json_array = {}
      json_array['name'] = @name
      json_array['resourceName'] = @resource_name

      JSON.pretty_generate(@json_array)
    end
  end
end
