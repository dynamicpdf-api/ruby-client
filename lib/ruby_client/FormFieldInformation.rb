module DynamicPDFApi
  #
  # Represents the form field information containing the collection of different types of field informations.
  #
  class FormFieldInformation
    def initialize
      @signature_fields = nil
      @text_fields = nil
      @choice_fields = nil
      @button_fields = nil
      @push_buttons = nil
      @multi_select_list_box_fields = nil
    end

    #
    # Gets or sets a collection of SignatureFieldInformation.
    #
    attr_accessor :signature_fields

    #
    # Gets or sets a collection of TextFieldInformation.
    #
    attr_accessor :text_fields

    #
    # Gets or sets a collection of ChoiceFieldInformation.
    #
    attr_accessor :choice_fields

    #
    # Gets or sets a collection of ButtonFieldInformation.
    #
    attr_accessor :button_fields

    #
    # Gets or sets a collection of PushButtonInformation.
    #
    attr_accessor :push_buttons

    #
    # Gets or sets a collection of MultiSelectListBoxInformation.
    #
    attr_accessor :multi_select_list_box_fields
  end
end
