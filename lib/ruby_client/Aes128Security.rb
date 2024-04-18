module DynamicPDFApi
  require_relative 'SecurityType'
  require_relative 'EncryptDocumentComponents'
  require_relative 'Security'

  #
  # Represents AES 128 bit PDF document security.
  #
  # AES 128 bit PDF security is compatible with PDF version 1.5 and higher and, Adobe Acrobat Reader version
  # 7 or higher is needed to open these documents. Older readers will not be able to read documents encrypted
  # with this security.
  #
  class Aes128Security < Security
    #
    # Initializes a new instance of the Aes128Security class by taking the owner and user passwords as parameters
    # to create PDF.
    #
    # @param user_password [String] The user password to open the document.
    # @param owner_password [String] The owner password to open the document.
    #
    def initialize(user_password, owner_password)
      @document_components = nil
      @_type = SecurityType::AES_128
      super(user_password, owner_password)

    end

    #
    # Gets or sets the EncryptDocumentComponents, components of the document to be encrypted. We can encrypt
    # all the PDF content or the content, excluding the metadata.
    #
    attr_accessor :document_components

    def to_json(_options = {})
      json_array = {}
      json_array['type'] = 'aes128'

      json_array['documentComponents'] = @document_components.downcase unless @document_components.nil?

      #-------------------------------------------
      json_array['allowCopy'] = @allow_copy unless @allow_copy.nil?

      json_array['allowEdit'] = @allow_edit unless @allow_edit.nil?

      json_array['allowPrint'] = @allow_print unless @allow_print.nil?

      unless @allow_update_annots_and_fields.nil?
        json_array['allowUpdateAnnotsAndFields'] =
          @allow_update_annots_and_fields
      end

      json_array['ownerPassword'] = @owner_password unless @owner_password.nil?

      json_array['userPassword'] = @user_password unless @user_password.nil?

      json_array['allowAccessibility'] = @allow_accessibility unless @allow_accessibility.nil?

      json_array['allowFormFilling'] = @allow_form_filling unless @allow_form_filling.nil?

      unless @allow_high_resolution_printing.nil?
        json_array['allowHighResolutionPrinting'] =
          @allow_high_resolution_printing
      end

      json_array['allowDocumentAssembly'] = @allow_document_assembly unless @allow_document_assembly.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
