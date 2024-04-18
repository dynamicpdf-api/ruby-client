module DynamicPDFApi
  #
  # Specifies EncodingType for DataMatrix Barcode.
  #
  class DataMatrixEncodingType
    #
    # Calculates Encoding based on Value.
    #
    AUTO = 'auto'.freeze

    #
    # Calculates ASCII Encoding based on Value.
    #
    AUTO_ASCII = 'autoAscii'.freeze

    #
    # ASCII Encoding.
    #
    ASCII = 'ascii'.freeze

    #
    # Extended ASCII Encoding.
    #
    EXTENDED_ASCII = 'extendedAscii'.freeze

    #
    # Double digit Encoding.
    #
    DOUBLE_DIGIT = 'doubleDigit'.freeze

    #
    # C40 Encoding.
    #
    C40 = 'c40'.freeze

    #
    # Text Encoding.
    #
    TEXT = 'text'.freeze

    #
    # ANSI X12 Encoding.
    #
    ANSI_X12 = 'ansiX12'.freeze

    #
    # EDIFACT Encoding.
    #
    EDIFACT = 'edifact'.freeze

    #
    # Base256 Encoding.
    #
    BASE256 = 'base256'.freeze
  end
end
