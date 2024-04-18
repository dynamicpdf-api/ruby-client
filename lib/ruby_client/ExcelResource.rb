module DynamicPDFApi
  require_relative "ResourceType"
  #
  # Represents a Excel resource.
  #
  class ExcelResource < Resource

    #
    # Initializes a new instance of the ExcelResource class.
    #
    # @param name="filePath">The Excel file path.
    # @param name="resourceName">The The resource name with file extension.
    def initialize(file, resourceName = nil)
      @resource_name = nil
      @file_extension = nil
      super(file, resourceName)

      @_type = ResourceType::EXCEL
      @_mime_type = nil
      super(file, resource_name)
    end

    #
    # Sets the resource name.
    #
    # @remarks The resource name should be specified with a file extension.
    def resource_name=(value)
      @resource_name = value
      if (value == nil || File.extname(value) == nil)
        raise "Invalid resource name."
      end
    end

    attr_accessor :mime_type

    def file_extension=(value)
      @file_extension = value
      inputFileExtension = ""
      if (@resource_name != nil)
        if (File.extname(value) != nil)
          inputFileExtension = File.extname(value).ToLower
        else
          raise "Invalid resource name."
        end
      elsif (FilePath != nil)
        if (File.extname(FilePath) != nil)
          inputFileExtension = File.extname(FilePath).ToLower
        else
          raise "Invalid file path specified."
        end
      else
        raise "Invalid file path or resource name."
      end

      if (inputFileExtension == ".xls")
        @mime_type = "application/vnd.ms-excel"
        ".xls"
      elsif (inputFileExtension == ".xlsx" && @data[0] == 0x50 && @data[1] == 0x4b)
        @mime_type = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        ".xlsx"
      else
        raise "Unsupported file type or invalid file extension."
      end
    end

    def SetMimeType()

      #  _ = FileExtension
    end

    def to_json(_options = {})
      json_array = {}
      json_array["type"] = "excel"

      json_array["resourceName"] = @resource_name
      JSON.pretty_generate(json_array)
    end
  end
end
