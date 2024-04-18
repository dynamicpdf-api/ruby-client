module DynamicPDFApi
  #
  # Represents information of a text field.
  #
  class TextFieldInformation
    def initialize
      @name = nil
      @value = nil
      @default_value = nil
    end

    #
    # Gets or Sets the name of the Text field.
    #
    attr_accessor :name

    #
    # Gets or Sets the value of the Text field.
    #
    attr_accessor :value

    #
    # Gets or Sets the default value of the Text field.
    #
    attr_accessor :default_value
  end
end
