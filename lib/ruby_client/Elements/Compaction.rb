module DynamicPDFApi
  #
  # The type of Compaction to encode.
  #
  class Compaction
    #
    # Byte Compaction.
    #
    BYTE = "byte".freeze

    #
    # Text Compaction.
    #
    TEXT = "text".freeze

    #
    # Numeric Compaction.
    #
    NUMERIC = "numeric".freeze

    #
    # All Compactions.
    #
    AUTO = "auto".freeze
  end
end
