module DynamicPDFApi
  require_relative 'Color'

  #
  # Represents a CMYK color.
  #
  class CmykColor < Color
    #
    # Initializes a new instance of the CmykColor class.
    #
    # Values must be between 0.0 and 1.0.
    #
    # @param cyan [float] The cyan intensity.
    # @param magenta [float] The magenta intensity.
    # @param yellow [float] The yellow intensity.
    # @param black [float] The black intensity.
    #
    def initialize(cyan = 0, magenta = 0, yellow = 0, black = 0)
      super()
      if cyan < 0.0 || cyan > 1.0 || magenta < 0.0 || magenta > 1.0 || yellow < 0.0 || yellow > 1.0 || black < 0.0 || black > 1.0
        raise 'CMYK values must be from 0.0 to 1.0.'
      end

      @_color_string = "cmyk(#{cyan},#{magenta},#{yellow},#{black})"
      @cyan = cyan
      @magenta = magenta
      @yellow = yellow
      @black = black
    end

    #
    # Gets the color black.
    #
    def black
      CmykColor.new(1, 1, 1, 1)
    end

    #
    # Gets the color white.
    #
    def white
      CmykColor.new(0, 0, 0, 0)
    end

    attr_accessor :_color_string
  end
end
