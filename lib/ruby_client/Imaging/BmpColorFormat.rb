module DynamicPDFApi
  require_relative 'ColorFormat'
  require_relative 'ColorFormatType'

  #
  # Base class for BMP color formats
  #
  class BmpColorFormat < ColorFormat
    #
    # Creates a new BmpColorFormat object with the given type.
    #
    def initialize(type)
      if type != ColorFormatType::Monochrome
        @type = ColorFormatType::RGB
      else
        @type = type
      end
    end
  end
end
