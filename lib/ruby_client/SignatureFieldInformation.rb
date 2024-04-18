module DynamicPDFApi
  #
  # Represents information of a signature field.
  #
  class SignatureFieldInformation
    def initialize
      @name = nil
      @signed = nil
    end

    #
    # Gets or Sets the name of a signature field.
    #
    attr_accessor :name

    #
    # Gets or Sets the boolean, indicating the field signed or not.
    #
    attr_accessor :signed
  end
end
