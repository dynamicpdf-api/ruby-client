module DynamicPDFApi
  #
  # Represents information of a PushButton field.
  #
  class PushButtonInformation
    def initialize
      @name = nil
      @label = nil
    end

    #
    # Gets or Sets the name of a PushButton field.
    #
    attr_accessor :name

    #
    # Gets or Sets the label of a PushButton field.
    #
    attr_accessor :label
  end
end
