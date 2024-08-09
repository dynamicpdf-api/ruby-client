module DynamicPDFApi
  #
  # Enum specifying the type of image size.
  #
  class ImageSizeType
    #
    # DPI-based image size.
    #
    Dpi = :Dpi.freeze

    #
    # Fixed image size.
    #
    Fixed = :Fixed.freeze

    #
    # Image size that fits within a given maximum size.
    #
    Max = :Max.freeze

    #
    # Percentage-based image size.
    #
    Percentage = :Percentage.freeze
  end
end
