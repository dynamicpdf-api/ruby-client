module DynamicPDFApi
  #
  # Represents page element type.
  #
  class ElementType
    #
    # Image element.
    #
    IMAGE = "Image".freeze

    #
    # Text element.
    #
    TEXT = "Text".freeze

    #
    # Page numbering element.
    #
    PAGE_NUMBERING = "PageNumbering".freeze

    #
    # Code 128 barcode element.
    #
    CODE128_BARCODE = "Code128Barcode".freeze

    #
    # Code 39 barcode element.
    #
    CODE39_BARCODE = "Code39Barcode".freeze

    #
    # Code 2 of 5 barcode element.
    #
    CODE25_BARCODE = "Code25Barcode".freeze

    #
    # Code 93 barcode element.
    #
    CODE93_BARCODE = "Code93Barcode".freeze

    #
    # Code 11 barcode element.
    #
    CODE11_BARCODE = "Code11Barcode".freeze

    #
    # GS1 DataBar barcode element.
    #
    GS1_DATA_BAR_BARCODE = "Gs1DataBarBarcode".freeze

    #
    # IATA 25 barcode element.
    #
    IATA25_BARCODE = "Iata25Barcode".freeze

    #
    # MSI barcode element.
    #
    MSI_BARCODE = "MsiBarcode".freeze

    #
    # Stacked GS1 DataBar barcode element.
    #
    STACKED_GS1_DATA_BAR_BARCODE = "StackedGs1DataBarBarcode".freeze

    #
    # Aztec barcode element.
    #
    AZTEC_BARCODE = "AztecBarcode".freeze

    #
    # QR Code barcode element.
    #
    QR_CODE = "QrCode".freeze

    #
    # PDF417 barcode element.
    #
    PDF417_BARCODE = "Pdf417Barcode".freeze

    #
    # Data Matrix barcode element.
    #
    DATA_MATRIX_BARCODE = "DataMatrixBarcode".freeze

    #
    # Rectangle element.
    #
    RECTANGLE = "Rectangle".freeze

    #
    # Line element.
    #
    LINE = "Line".freeze
  end
end
