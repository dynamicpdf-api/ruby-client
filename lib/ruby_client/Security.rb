module DynamicPDFApi
  require_relative 'SecurityType'

  #
  # Base class from which all security classes are derived.
  #
  class Security
    def initialize(user_pwd = nil, owner_pwd = nil)
      @_user_password = user_pwd
      @_owner_password = owner_pwd
      @_allow_copy = nil
      @_allow_edit = nil
      @_allow_print = nil
      @_allow_update_annots_and_fields = nil

      @_allow_accessibility = nil
      @_allow_form_filling = nil
      @_allow_high_resolution_printing = nil
      @_allow_document_assembly = nil
      @_type = nil
    end

    #
    # Gets or sets if text and images can be copied to the clipboard by the user.
    #
    attr_accessor :allow_copy

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
    # Gets or sets the owner password.
    #
    attr_accessor :owner_password

    #
    # Gets or sets the user password.
    #
    attr_accessor :user_password

    #
    # Gets or sets if accessibility programs should be able to read the documents text and images for the user.
    #
    attr_accessor :allow_accessibility

    #
    # Gets or sets if form filling should be allowed by the user.
    #
    attr_accessor :allow_form_filling

    #
    # Gets or sets if the document can be printed at a high resolution by the user.
    #
    attr_accessor :allow_high_resolution_printing

    #
    # Gets or sets if the document can be assembled and manipulated by the user.
    #
    attr_accessor :allow_document_assembly
  end
end
