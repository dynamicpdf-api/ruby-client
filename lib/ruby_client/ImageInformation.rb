module DynamicPDFApi
  #
  # Represents an image information.
  #
  class ImageInformation
    def initialize(_resource)
      @page_number = nil
      @width = nil
      @height = nil
      @horizontal_dpi = nil
      @vertical_dpi = nil
      @number_of_components = nil
      @bits_per_component = nil
      @color_space = nil
    end

    #
    # Gets page number of the pdf where the image is present.
    #
    attr_accessor :page_number

    #
    # Gets the width of the image.
    #
    attr_accessor :width

    #
    # Gets the height of the image.
    #
    attr_accessor :height

    #
    # Gets the horizontalDpi of the image.
    #
    attr_accessor :horizontal_dpi

    #
    # Gets the verticalDpi of the image.
    #
    attr_accessor :vertical_dpi

    #
    # Gets the number of color components present in the image.
    #
    attr_accessor :number_of_components

    #
    # Gets the bits per component of the image.
    #
    attr_accessor :bits_per_component

    #
    # Gets the color space of the image.
    #
    attr_accessor :color_space
  end
end
