module DynamicPDFApi
  require 'securerandom'
  require_relative 'ResourceType'
  require_relative 'EndPointException'

  class Resource
    def initialize(file = nil, resource_name = nil)
      @_name = nil
      @_type = nil
      @_file_path = nil
      @_mime_type = ''
      unless file.nil?
        if (file.is_a?(Array)) == true
          @data = file.pack('c*')
        elsif file.is_a?(String)
          if File.exist?(file)
            @_file_path = file
            @data = Resource._get_file_data(file)
          else
            raise "#{file} : File does not exist."
          end
        else
          @data = file.read
        end

        @resource_name = if resource_name.nil?
                           SecureRandom.uuid + _file_extension
                         else
                           resource_name
                         end

        @_mime_type = ''
      end
    end

    attr_accessor :data, :_mime_type, :_file_path

    #
    # Gets or sets the resource name.
    #
    attr_accessor :resource_name

    def _file_extension
      File.extname(@_file_path) unless @_file_path.nil?
    end

    def self._get_file_data(file_path)
      File.binread(file_path)
    end
  end
end
