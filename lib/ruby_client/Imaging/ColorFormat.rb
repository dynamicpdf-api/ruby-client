module DynamicPDFApi
  #
  # Base class for all color formats.
  #
  class ColorFormat
    #
    # Initializes a new instance of ColorFormat.
    #
    def initialize
      @type = nil
    end

    #
    # Gets or sets the color format type.
    #
    attr_accessor :type
  end
end
