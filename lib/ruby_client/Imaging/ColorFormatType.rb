module DynamicPDFApi
  #
  # Enum representing color formats.
  #
  class ColorFormatType
    #
    # RGB color format.
    #
    RGB = :Rgb.freeze

    #
    # RGBA color format.
    #
    RGBA = :Rgba.freeze

    #
    # Grayscale color format.
    #
    Grayscale = :Grayscale.freeze

    #
    # Monochrome color format.
    #
    Monochrome = :Monochrome.freeze

    #
    # Indexed color format.
    #
    Indexed = :Indexed.freeze
  end
end
