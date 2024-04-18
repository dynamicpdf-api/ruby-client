module DynamicPDFApi
  #
  # Represents information of a MultiSelectListBox.
  #
  class MultiSelectListBoxInformation
    def initialize
      @name = nil
      @values = {}
      @default_values = {}
      @export_values = {}
      @items = {}
      @items_export_values = {}
    end

    #
    # Gets or Sets the name of a MultiSelectListBox.
    #
    attr_accessor :name

    #
    # Gets or sets a collection of values of the MultiSelectListBox.
    #
    attr_accessor :values

    #
    # Gets or sets a collection of default values of the MultiSelectListBox.
    #
    attr_accessor :default_values

    #
    # Gets or sets a collection of export values of the MultiSelectListBox.
    #
    attr_accessor :export_values

    #
    # Gets or sets a collection of items of the MultiSelectListBox.
    #
    attr_accessor :items

    #
    # Gets or sets a collection of export values of the MultiSelectListBox.
    #
    attr_accessor :items_export_values
  end
end
