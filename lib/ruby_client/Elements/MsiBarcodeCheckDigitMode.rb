module DynamicPDFApi
  #
  # MSI Barcode check digit modes.
  #
  class MsiBarcodeCheckDigitMode
    #
    # No check digit.
    #
    NONE = 'none'.freeze

    #
    # check digit of mod 10.
    #
    MOD10 = 'mod10'.freeze

    #
    # check digit of mod 11.
    #
    MOD11 = 'mod11'.freeze

    #
    # check digit of mod 1010.
    #
    MOD1010 = 'mod1010'.freeze

    #
    # check digit of mod 1110.
    #
    MOD1110 = 'mod1110'.freeze
  end
end
