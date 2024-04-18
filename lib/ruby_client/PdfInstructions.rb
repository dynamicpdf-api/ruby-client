module DynamicPDFApi
  require_relative 'Security'
  require_relative 'FormField'
  require_relative 'Font'

  class PdfInstructions
    attr_accessor :_form_fields, :_templates, :_fonts, :_out_lines, :_inputs, :_author, :_title, :_subject, :_creator, :_producer, :_tag,
                  :_keywords, :_security, :_flatten_all_form_fields, :_retain_signature_form_fields

    def initialize
      @_author = ''
      @_title = ''
      @_subject = ''
      @_creator = ''
      @_producer = ''
      @_tag = nil
      @_keywords = ''
      @_form_fields = []
      @_templates = {}
      @_fonts = {}
      @_outlines = []
      @_inputs = []
      @_security = nil
      @_flatten_all_form_fields = nil
      @_retain_signature_form_fields = nil
    end

    def to_json( indented = false)
      # @inputJsonArray = []

      # @_Inputs.each do |input|
      #   if(input != nil)
      #   @inputJsonArray << input
      #   end
      # end

      fonts_json = []
      @_fonts.each_value do |font|
        fonts_json << font
      end

      templates_json = []
      @_templates.each_value do |template|
        templates_json << template unless template.nil?
      end

      json_array = {}

      if(templates_json.length > 0)
        json_array['templates'] = templates_json
      end

      if(fonts_json.length > 0)
        json_array['fonts'] = fonts_json
      end

      if(@_author != nil)
        json_array['author'] = @_author
      end

      if(@_title != nil)
        json_array['title'] = @_title
      end

      json_array['subject'] = @_subject unless @_subject.nil?

      json_array['creator'] = @_creator unless @_creator.nil?

      json_array['producer'] = @_producer unless @_producer.nil?

      json_array['tag'] = @_tag unless @_tag.nil?

      json_array['keywords'] = @_keywords unless @_keywords.nil?

      json_array['security'] = @_security unless @_security.nil?

      json_array['flattenAllFormFields'] = @_flatten_all_form_fields unless @_flatten_all_form_fields.nil?

      json_array['retainSignatureFormFields'] = @_retain_signature_form_fields unless @_retain_signature_form_fields.nil?

      json_array['inputs'] = @_inputs

      if(@_form_fields.length > 0)
        json_array['formFields'] = @_form_fields
      end

      if(@_outlines.length > 0)
        json_array['outlines'] = @_outlines
      end
      if(indented)
        JSON.pretty_generate(json_array)
      else
        JSON.generate(json_array)
      end
    end
  end
end
