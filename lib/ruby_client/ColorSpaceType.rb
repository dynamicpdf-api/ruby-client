module DynamicPDFApi
  #
  # Specifies Color Space.
  #
  class ColorSpaceType
    #
    # Represents a Monochrome color space.
    #
    MONOCHROME = 'monochrome'.freeze

    #
    # Represents a Grayscale color space.
    #
    GRAYSCALE = 'grayscale'.freeze

    #
    # Represents an RGB color space.
    #
    RGB = 'rGB'.freeze

    #
    # Represents a CMYK color space.
    #
    CMYK = 'cMYK'.freeze

    #
    # Represents an Indexed color space.
    #
    INDEXED = 'indexed'.freeze

    #
    # Unknown color space.
    #
    UNKNOWN = 'unknown'.freeze
  end
end
