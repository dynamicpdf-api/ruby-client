module DynamicPDFApi
  #
  #
  # Represents a form field in the PDF document.
  #
  #
  class FormField
    #
    # Initializes a new instance of the FormField class using the name and the value of the form field as parameters.
    #
    # @param name [String] The name of the form field.
    # @param value [String] The value of the form field.
    #
    def initialize(name, value = nil)
      @flatten = nil
      @remove = nil

      @name = name
      @value = value
    end

    #
    # Gets or sets name of the form field.
    #
    attr_accessor :name

    #
    # Gets or sets value of the form field.
    #
    attr_accessor :value

    #
    # Gets or sets a boolean indicating whether to flatten the form field.
    #
    attr_accessor :flatten

    #
    # Gets or sets a boolean indicating whether to remove the form field.
    #
    attr_accessor :remove

    def to_json(_options = {})
      json_array = {}
      json_array['name'] = @name
      json_array['value'] = @value unless @value.nil?

      json_array['flatten'] = @flatten unless @flatten.nil?

      json_array['remove'] = @remove unless @remove.nil?

       JSON.pretty_generate(json_array)
    end
  end
end
