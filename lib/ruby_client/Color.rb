module DynamicPDFApi
  #
  # Base class representing a color.
  #
  class Color
    def initialize
      @_color_string = nil
    end

    attr_accessor :_color_string
  end
end
