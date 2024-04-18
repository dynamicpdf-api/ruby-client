module DynamicPDFApi
  require_relative "Color"

  #
  # Represents a grayscale color.
  #
  class Grayscale < Color
    #
    # Initializes a new instance of the  Grayscale class.
    #
    # @param gray_level [float] The gray level for the color.
    #
    def initialize(gray_level = 0)
      super()
      @gray_level = gray_level
      @_color_string = "gray(#{gray_level})"
    end

    def self.create_grayscale(gray_level)
      gray_scale = Grayscale.new
      gray_scale._color_string = gray_level
      gray_scale
    end

    #
    # Gets the color black.
    #
    def self.black
      Grayscale.new(0)
    end

    #
    # Gets the color white.
    #
    def self.white
      Grayscale.new(1)
    end

    attr_accessor :_color_string
  end
end
