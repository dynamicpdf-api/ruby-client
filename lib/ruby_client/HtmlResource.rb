module DynamicPDFApi
  #
  # Represents a pdf resource.
  #
  class HtmlResource < Resource

    #
    # Initializes a new instance of the HtmlResource class.
    #
    # @param name="html">The input html string.
    # @param name="resourceName">The name of the resource.
    def initialize(html, resourceName = nil)
      @_file_extension = ".html"
      @_mime_type = "text/html"

      @data = html

      @resource_name = if resource_name.nil?
          SecureRandom.uuid + @_file_extension
        else
          resource_name
        end
      _type = ResourceType::HTML
    end

    def to_json(_options = {})
      json_array = {}
      json_array["type"] = "html"

      json_array["resourceName"] = @resource_name
      JSON.pretty_generate(json_array)
    end
  end
end
