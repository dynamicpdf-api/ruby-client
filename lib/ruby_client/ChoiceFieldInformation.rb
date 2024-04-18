module DynamicPDFApi
  #
  # Represents the information of a choice field in interactive forms. A choice field contains several text
  # items, one or more of which may be selected as the field value.
  #
  class ChoiceFieldInformation
    def initialize
      @name = nil
      @_type = nil
      @value = nil
      @default_value = nil
      @export_value = nil
      @items = {}
      @item_export_values = {}
    end

    #
    # Gets or Sets the name of the choice field.
    #
    attr_accessor :name

    #
    # Gets or sets the ChoiceFieldType. ex: ListBox, ComboBox etc.
    #
    attr_accessor :type

    #
    # Gets or sets the value of the choice field.
    #
    attr_accessor :value

    #
    # Gets or Sets the default value of the choice field.
    #
    attr_accessor :default_value

    #
    # Gets or Sets the export value.
    #
    attr_accessor :export_value

    #
    # Gets the collection of items.
    #
    attr_accessor :items

    #
    # Gets the collection of export values of the items present in the choice field.
    #
    attr_accessor :item_export_values
  end
end
