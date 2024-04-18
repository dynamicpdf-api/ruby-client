module DynamicPDFApi
  #
  # Represents information of a button field.
  #
  class ButtonFieldInformation
    def initialize
      @name = nil
      @_type = nil
      @value = nil
      @default_value = nil
      @export_value = nil
      @export_values = {}
    end

    #
    # Gets or Sets the name of the button field.
    #
    attr_accessor :name

    #
    # Gets or sets the type of the button field, ex: RadioButton, CheckBox etc.
    #
    attr_accessor :type

    #
    # Gets or sets the value of the button field.
    #
    attr_accessor :value

    #
    # Gets or Sets the default value of the button field.
    #
    attr_accessor :default_value

    #
    # Gets or Sets the export value. These values will be exported when submitting the form.
    #
    # To create a set of mutually exclusive radio buttons (i.e., where only one can be selected at a time),
    # create the fields with the same name but different export values.
    #
    attr_accessor :export_value

    #
    # Gets the collection of export value.
    #
    attr_accessor :export_values
  end
end
