module DynamicPDFApi
  require_relative 'Security'
  require_relative 'SecurityType'

  #
  # Represents RC4 128 bit PDF document security.
  #
  # RC4 128 bit PDF security, with UseCryptFilter property set to false is compatible with PDF version 1.4
  # or higher and can be read with Adobe Acrobat Reader version 5 or higher. By default UseCryptFilter property
  # is false. RC4 128 bit PDF security with crypt filter is compatible with PDF version 1.5 or higher and
  # can be read with Adobe Acrobat Reader version 6 and higher. Older readers will not be able to read document
  # encrypted with this security.
  #
  class RC4128Security < Security
    #
    # Initializes a new instance of the RC4128Security class.
    #
    # @param owner_password [String] The owner password to open the document.
    # @param user_password [String] The user password to open the document.
    #
    def initialize(user_password, owner_password)
      @_type = SecurityType::RC_4128
      super(user_password, owner_password)
      @encrypt_metadata = nil
    end

    #
    # Gets or sets the documents components to be encrypted.
    #
    attr_accessor :encrypt_metadata

    def to_json(_options = {})
      json_array = {}
      json_array['type'] = 'rc4128'

      json_array['encryptMetadata'] = @encrypt_metadata unless @encrypt_metadata.nil?

      #-------------------------------------------
      json_array['allowCopy'] = @allow_copy unless @allow_copy.nil?

      json_array['allowEdit'] = @allow_edit unless @allow_edit.nil?

      json_array['allowPrint'] = @allow_print unless @allow_print.nil?

      json_array['allowUpdateAnnotsAndFields'] = @allow_update_annots_and_fields unless @allow_update_annots_and_fields.nil?

      json_array['ownerPassword'] = @owner_password unless @owner_password.nil?

      json_array['userPassword'] = @user_password unless @user_password.nil?

      json_array['allowAccessibility'] = @allow_accessibility unless @allow_accessibility.nil?

      json_array['allowFormFilling'] = @allow_form_filling unless @allow_form_filling.nil?

      json_array['allowHighResolutionPrinting'] = @allow_high_resolution_printing unless @allow_high_resolution_printing.nil?

      json_array['allowDocumentAssembly'] = @allow_document_assembly unless @allow_document_assembly.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
