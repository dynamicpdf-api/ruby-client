module DynamicPDFApi
  require_relative "RgbColor"

  #
  # Represents an RGB color created using the web hexadecimal convention.
  #
  class WebColor < RgbColor
    #
    # Initializes a new instance of the WebColor class.
    #
    # @param web_hex_string [String] The hexadecimal string representing the color.
    #
    def initialize(web_hex_string)
      super()
      @_color_string = web_hex_string
    end
  end
end
