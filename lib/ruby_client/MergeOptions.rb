module DynamicPDFApi
  #
  # Represents different options for merging PDF documents.
  #
  class MergeOptions
    def initialize
      @document_info = nil
      @document_java_script = nil
      @document_properties = nil
      @embedded_files = nil
      @form_fields = nil
      @forms_xfa_data = nil
      @logical_structure = nil
      @open_action = nil
      @optional_content_info = nil
      @out_lines = nil
      @output_intent = nil
      @page_annotations = nil
      @page_labels_and_sections = nil
      @root_form_field = nil
      @xmp_metadata = nil
    end

    #
    # Gets or sets a boolean indicating whether to import document information when merging.
    #
    attr_accessor :document_info

    #
    # Gets or sets a boolean indicating whether to import document level JavaScript when merging.
    #
    attr_accessor :document_java_script

    #
    # Gets or sets a boolean indicating whether to import document properties when merging.
    #
    attr_accessor :document_properties

    #
    # Gets or sets a boolean indicating whether to import embedded files when merging.
    #
    attr_accessor :embedded_files

    #
    # Gets or sets a boolean indicating whether to import form fields when merging.
    #
    attr_accessor :form_fields

    #
    # Gets or sets a boolean indicating whether to import XFA form data when merging.
    #
    attr_accessor :forms_xfa_data

    #
    # Gets or sets a boolean indicating whether to import logical structure (tagging information) when merging.
    #
    attr_accessor :logical_structure

    #
    # Gets or sets a boolean indicating whether to import document's opening action (initial page and zoom settings) when merging.
    #
    attr_accessor :open_action

    #
    # Gets or sets a boolean indicating whether to import optional content when merging.
    #
    attr_accessor :optional_content_info

    #
    # Gets or sets a boolean indicating whether to import outlines and bookmarks when merging.
    #
    attr_accessor :out_lines

    #
    # Gets or sets a boolean indicating whether to import OutputIntent when merging.
    #
    attr_accessor :output_intent

    #
    # Gets or sets a boolean indicating whether to import PageAnnotations when merging.
    #
    attr_accessor :page_annotations

    #
    # Gets or sets a boolean indicating whether to import PageLabelsAndSections when merging.
    #
    attr_accessor :page_labels_and_sections

    #
    # Gets or sets the root form field for imported form fields. Useful when merging a PDF repeatedly to have a better contorl on the form field names.
    #
    attr_accessor :root_form_field

    #
    # Gets or sets a boolean indicating whether to import XmpMetadata when merging.
    #
    attr_accessor :xmp_metadata

    def to_json(_options = {})
      json_array = {}

      json_array['documentInfo'] = @document_info unless @document_info.nil?

      json_array['documentJavaScript'] = @document_java_script unless @document_java_script.nil?

      json_array['documentProperties'] = @document_properties unless @document_properties.nil?

      json_array['embeddedFiles'] = @embedded_files unless @embedded_files.nil?

      json_array['formFields'] = @form_fields unless @form_fields.nil?

      json_array['formsXfaData'] = @forms_xfa_data unless @forms_xfa_data.nil?

      json_array['logicalStructure'] = @logical_structure unless @logical_structure.nil?

      json_array['openAction'] = @open_action unless @open_action.nil?

      json_array['optionalContentInfo'] = @optional_content_info unless @optional_content_info.nil?

      json_array['outlines'] = @out_lines unless @out_lines.nil?

      json_array['outputIntent'] = @output_intent unless @output_intent.nil?

      json_array['pageAnnotations'] = @page_annotations unless @page_annotations.nil?

      json_array['pageLabelsAndSections'] = @page_labels_and_sections unless @page_labels_and_sections.nil?

      json_array['rootFormField'] = @root_form_field unless @root_form_field.nil?

      json_array['xmpMetadata'] = @xmp_metadata unless @xmp_metadata.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
