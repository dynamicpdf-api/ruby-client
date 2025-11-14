module DynamicPDFApi
  require_relative 'EncryptionType'

  # Represents the PDF security info endpoint.
  class PdfSecurityInfo
    def initialize(data = {})
      @encryption_type_string       = data["encryptionType"]
      @allow_edit                   = data["allowEdit"]
      @allow_print                  = data["allowPrint"]
      @allow_update_annots_and_fields = data["allowUpdateAnnotsAndFields"]
      @allow_copy                   = data["allowCopy"]
      @allow_high_resolution_printing = data["allowHighResolutionPrinting"]
      @allow_document_assembly      = data["allowDocumentAssembly"]
      @allow_form_filling           = data["allowFormFilling"]
      @allow_accessibility          = data["allowAccessibility"]
      @encrypt_all_except_metadata  = data["encryptAllExceptMetadata"]
      @encrypt_only_file_attachments = data["encryptOnlyFileAttachments"]
      @has_owner_password           = data["hasOwnerPassword"]
      @has_user_password            = data["hasUserPassword"]
      @encryption_type = encryption_type()
    end

    #
    # Gets or sets if the document can be edited by the user.
    #
    attr_accessor :allow_edit

    #
    # Gets or sets if the document can be printed by the user.
    #
    attr_accessor :allow_print

    #
    # Gets or sets if annotations and form fields can be added, edited and modified by the user.
    #
    attr_accessor :allow_update_annots_and_fields

    #
    # Gets or sets if text and images can be copied to the clipboard by the user.
    #
    attr_accessor :allow_copy

    #
    # Gets or sets if the document can be printed at a high resolution by the user.
    #
    attr_accessor :allow_high_resolution_printing

    #
    # Gets or sets if the document can be assembled and manipulated by the user.
    #
    attr_accessor :allow_document_assembly

    #
    # Gets or sets if form filling should be allowed by the user.
    #
    attr_accessor :allow_form_filling

    #
    # Gets or sets if accessibility programs should be able to read the documents text and images for the user.
    #
    attr_accessor :allow_accessibility

    #
    # Gets or sets a value indicating whether all data should be encrypted except for metadata.
    #
    attr_accessor :encrypt_all_except_metadata

    #
    # Gets or sets a value indicating whether only file attachments should be encrypted.
    #
    attr_accessor :encrypt_only_file_attachments

    #
    # Gets or sets a value indicating whether the PDF document has an owner password set.
    #
    attr_accessor :has_owner_password

    #
    # Gets or sets a value indicating whether the PDF document has an user password set.
    #
    attr_accessor :has_user_password


    # Gets or sets the encryption type.
    attr_accessor :encryption_type_string

    def encryption_type
      case (@encryption_type_string).downcase
      when "rc4-40"
        EncryptionType::RC440
      when "rc4-128"
        EncryptionType::RC4128
      when "aes-128-cbc"
        EncryptionType::AES128CBC
      when "aes-256-cbc"
        EncryptionType::AES256CBC
      else
        EncryptionType::NONE
      end
    end
  end
end
