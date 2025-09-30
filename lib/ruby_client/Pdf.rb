module DynamicPDFApi
  require "net/http"
  require "net/https"
  require "uri"
  require "json"
  require "openssl"

  require_relative "Endpoint"
  require_relative "PdfInstructions"
  require_relative "Input"
  require_relative "PdfInput"
  require_relative "Resource"
  require_relative "PdfResource"
  require_relative "PdfResponse"
  require_relative "PageInput"
  require_relative "OutlineList"

  #
  # Represents a pdf endpoint.
  #
  class Pdf < Endpoint
    #
    # Initializes a new instance of the Pdf class.
    #
    def initialize
      super
      @_endpoint_name = "pdf"
      @out_lines = OutlineList.new
      @instructions = PdfInstructions.new
      @author = nil
      @resources = {}
      @title = nil
      @subject = nil
      @creator = ""
      @producer = ""
      @tag = nil
      @keywords = nil
      @security = nil
      @flatten_all_form_fields = nil
      @retain_signature_form_fields = nil
      @inputs = []
      @templates = {}
      @fonts = {}
      @form_fields = []
    end

    #
    # Adds additional resource to the endpoint.
    #
    # <param name="resourcePath">The resource file path.
    # <param name="resourceName">The name of the resource.
    def add_additional_resource(resourcePath, resourceName = nil)
      if (resourceName == nil)
        resourceName = File.basename(resourcePath)
      end
      additional_resource = AdditionalResource.new(resourcePath, resourceName)
      @resources[resourceName] = additional_resource
      # @additionalResources << additional_resource
    end

    def add_additional_resource_with_resourcedata(resourceData, additionalResourceType, resourceName)
      type = ResourceType::PDF
      case (additionalResourceType)

      when AdditionalResourceType::FONT
        type = ResourceType::FONT
      when AdditionalResourceType::IMAGE
        type = ResourceType::IMAGE
      when AdditionalResourceType::PDF
        type = ResourceType::PDF
      when AdditionalResourceType::HTML
        type = ResourceType::HTML
      else
        raise 'This type of resource not allowed'
      end
      additional_resource = AdditionalResource.new(resourceData, resourceName, type)
      @additionalResources << additional_resource
    end

    attr_accessor :instructions

    #
    # Gets or sets the collection of resource.
    #
    attr_accessor :resources

    #
    # Gets or sets the author.
    #
    attr_accessor :author

    #
    # Gets or sets the title.
    #
    attr_accessor :title

    #
    # Gets or sets the subject.
    #
    attr_accessor :subject

    #
    # Gets or sets the creator.
    #
    attr_accessor :creator

    #
    # Gets or sets the PDF producer.
    #
    attr_accessor :producer

    #
    # Gets or sets the Tag property.
    #
    attr_accessor :tag

    #
    # Gets or sets the keywords.
    #
    attr_accessor :keywords

    #
    # Gets or sets the security.
    #
    attr_accessor :security

    #
    # Gets or sets the value indicating whether to flatten all form fields.
    #
    attr_accessor :flatten_all_form_fields

    #
    # Gets or sets the value indicating whether to retain signature form field.
    #
    attr_accessor :retain_signature_form_fields

    #
    # Returns a PdfInput object containing the input pdf.
    #
    # @param resource [String]|[PdfResource] The resource path in cloud resource manager or the resource of type PdfResource.
    # @param options [MergeOptions] The merge options for the pdf.
    #
    # @return PdfInput PdfInput object.
    #
    def add_pdf(resource, options = nil)
      input = PdfInput.new(resource, options)
      @inputs << input
      input
    end

    #
    # Returns an ImageInput object containing the input pdf.
    #
    # @param resource [String]|[ImageResource] The resource path in cloud resource manager or the resource of type ImageResource.
    #
    # @return ImageInput ImageInput object.
    #
    def add_image(resource)
      input = ImageInput.new(resource)
      @inputs << input
      input
    end

    #
    # Returns an HtmlInput object containing the input pdf.
    #
    # @param resource [String]|[HtmlResource] The resource of type HtmlResource.
    #
    # @return HtmlInput HtmlInput object.
    #
    def add_html(html, basepath = nil, size = nil, orientation = nil, margins = nil)
      input = nil
      if html.is_a?(String)
        input = HtmlInput.new(HtmlResource.new(html), basepath, size, orientation, margins)
      else
        input = HtmlInput.new(resource, basepath, size, orientation, margins)
      end

      @inputs << input
      input
    end

    #
    # Returns a WordInput object containing the input pdf.
    #
    # @param resource [WordResource] The resource of type WordResource.
    #
    # @return WordInput WordInput object.
    #
    def add_word(resource, size = nil, orientation = nil, margins = nil)
      input = WordInput.new(resource, size, orientation, margins)
      @inputs << input
      input
    end

    #
    # Returns a ExcelInput object containing the input pdf.
    #
    # @param resource [ExcelResource] The resource of type ExcelResource.
    #
    # @return ExcelInput ExcelInput object.
    #
    def add_excel(resource, size = nil, orientation = nil, margins = nil)
      input = ExcelInput.new(resource, size, orientation, margins)
      @inputs << input
      input
    end

    #
    # Returns a DlexInput object containing the input pdf.
    #
    # @param dlex [String]|[DlexResource] The resource path in cloud resource manager or the dlex resource of type DlexResource.
    # @param layout_data [String]|[Layout_dataResource] The layout data resource path in cloud resource manager or the layout data resource of type Layout_dataResource.
    #
    # @return DlexInput DlexInput object.
    #
    def add_dlex(dlex, layout)
      input = DlexInput.new(dlex, layout)
      @inputs << input
      input
    end

    #
    # Returns a page_input object containing the input pdf.
    #
    # @param page_width [float] The width of the page.
    # @param page_height [float] The height of the page.
    #
    # @return page_input page_input object.
    #
    def add_page(page_width = nil, page_height = nil)
      input = if !page_width.nil? && !page_height.nil?
          PageInput.new(page_width, page_height)
        else
          PageInput.new
        end
      @inputs << input
      input
    end

    #
    # Gets the inputs.
    #
    attr_reader :inputs

    def inputs=(_value)
      @inputs = {}
    end

    #
    # Gets the templates.
    #
    attr_accessor :templates

    #
    # Gets the fonts.
    #
    attr_accessor :fonts

    #
    # Gets the formFields.
    #
    attr_accessor :form_fields

    #
    # Gets the outlines.
    #
    attr_accessor :out_lines

    #
    # Process to create pdf.
    #
    # @return PdfResponse Returns collection of PdfResponse.
    #
    def process
      @instructions._author = @author
      @instructions._title = @title
      @instructions._subject = @subject
      @instructions._creator = @creator
      @instructions._producer = @producer
      @instructions._tag = @tag
      @instructions._keywords = @keywords
      @instructions._security = @security
      @instructions._flatten_all_form_fields = @flatten_all_form_fields
      @instructions._retain_signature_form_fields = @retain_signature_form_fields
      @instructions._inputs = @inputs

      @instructions._templates = @templates
      @instructions._fonts = @fonts
      @instructions._form_fields = @form_fields
      @instructions._out_lines = @out_lines
      # @Instructions.form_fields = @form_fields

      @instructions._inputs.each do |input|
        if input._type == InputType::PAGE
          page_input = input
          page_input.elements.each do |element|
            @resources[element._resource.resource_name] = element._resource unless element._resource.nil?
            if !element._text_font.nil?
              font_serialized_array = element._text_font
              @instructions._fonts[element._text_font._name] = font_serialized_array
            end
          end
        end

        input._resources.each do |resource|
          @resources[resource.resource_name] = resource unless resource.nil?
        end

        if !input.get_template.nil?
          template = input.get_template
          @instructions._templates[template.id] = template
          if !input.get_template.elements.nil? && !input.get_template.elements.empty?
            input.get_template.elements.each do |element|
              @resources[element._resource.resource_name] = element._resource unless element._resource.nil?
              if !element._text_font.nil?
                font_serialized_array = element._text_font

                @instructions._fonts[element._text_font._name] = font_serialized_array
              end
            end
          end
        end
      end

      data_string = @instructions.to_json

      header = {
        'authorization': "Bearer #{@api_key}",
        'Expect': "100-continue",
      }
      uri = URI.parse("#{@base_url}/v1.0/#{@_endpoint_name}")
      request = Net::HTTP::Post.new(uri.request_uri, header)

      req_options = {
        use_ssl: uri.scheme == "https",
        verify_mode: OpenSSL::SSL::VERIFY_NONE,

      }

      resource_array = []
      json_bytes = data_string.encode("UTF-8") # UTF-8 text
      resource_array << ["Instructions",json_bytes.force_encoding("ASCII-8BIT"), # send as binary even if UTF-8 text
        { content_type: "application/json", filename: "Instructions.json" }
      ]

      @resources.each_value do |field|
        data = if !field._file_path.nil?
            File.binread(field._file_path)
          else
            field.data
          end

        resource_array << ["Resource", data,
                           { content_type: "application/octet-stream", filename: field.resource_name }]
      end
      request.set_form(resource_array, "multipart/form-data")

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      ret_object = PdfResponse.new
      ret_object.is_successful = false
      ret_object.status_code = response.code
      out_data = response.body

      if !ret_object.nil? && ret_object.status_code == "200" && out_data[0, 4].eql?("%PDF") == true
        ret_object = PdfResponse.new(out_data)
        ret_object.is_successful = true
      else
        if ret_object.status_code == '401'
          raise "Invalid api key specified."
        end
        out_data_json = JSON.parse(out_data)
        ret_object.error_json = out_data
        ret_object.error_message = if !out_data_json["message"].nil?
            out_data_json["message"]
          else
            "status_code : #{Net::HTTPResponse::CODE_TO_OBJ[ret_object.status_code]}"
          end
        ret_object.error_id = out_data_json["id"]
      end

      ret_object
    end

    def get_instructions_json(indented = false)
      @tembInstructions = PdfInstructions.new
      @tembInstructions._author = @author
      @tembInstructions._title = @title
      @tembInstructions._subject = @subject
      @tembInstructions._creator = @creator
      @tembInstructions._producer = @producer
      @tembInstructions._tag = @tag
      @tembInstructions._keywords = @keywords
      @tembInstructions._security = @security
      @tembInstructions._flatten_all_form_fields = @flatten_all_form_fields
      @tembInstructions._retain_signature_form_fields = @retain_signature_form_fields
      @tembInstructions._inputs = @inputs
      @tembInstructions._templates = @templates
      @tembInstructions._fonts = @fonts
      @tembInstructions._form_fields = @form_fields
      @tembInstructions._out_lines = @out_lines
      # @tembInstructions.form_fields = @form_fields

      @tembInstructions._inputs.each do |input|
        if input._type == InputType::PAGE
          page_input = input
          page_input.elements.each do |element|
            @resources[element._resource.resource_name] = element._resource unless element._resource.nil?
            if !element._text_font.nil?
              font_serialized_array = element._text_font
              @tembInstructions._fonts[element._text_font._name] = font_serialized_array
            end
          end
        end

        input._resources.each do |resource|
          @resources[resource.resource_name] = resource unless resource.nil?
        end

        if !input.get_template.nil?
          template = input.get_template
          @tembInstructions._templates[template.id] = template
          if !input.get_template.elements.nil? && !input.get_template.elements.empty?
            input.get_template.elements.each do |element|
              @resources[element._resource.resource_name] = element._resource unless element._resource.nil?
              if !element._text_font.nil?
                font_serialized_array = element._text_font

                @tembInstructions._fonts[element._text_font._name] = font_serialized_array
              end
            end
          end
        end
      end
      #data_string = @instructions.to_json
      @tembInstructions.to_json
    end
  end
end
