module DynamicPDFApi
  require_relative "Resource"
  require_relative "ResourceType"

  #
  # Represents a pdf resource.
  #
  class PdfResource < Resource
    #
    # Initializes a new instance of the PdfResource class.
    #
    # @param file [String]|[Array]|[Stream] The pdf file path or the byte array of the pdf file or the stream of the pdf file.
    # @param resource_name [String] The name of the resource.
    #
    def initialize(file, resource_name = nil)
      super(file, resource_name)
      @_mime_type = "application/pdf"
    end

    @_type = ResourceType::PDF

    def _file_extension
      ".pdf"
    end

    # ?string ResourcePath

    def to_json(_options = {})
      @input_json = {}
      @input_json["type"] = @_type

      @input_json["resourceName"] = @resource_name
      JSON.pretty_generate(@input_json)
    end
  end
end
