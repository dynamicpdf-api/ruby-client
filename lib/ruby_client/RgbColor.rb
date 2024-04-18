module DynamicPDFApi
  require_relative "EndpointException"
  require_relative "Color"

  #
  # Represents an RGB color.
  #
  class RgbColor < Color
    # private string colorString
    attr_accessor :_color_string

    #
    # Initializes a new instance of the RgbColor class.
    #
    # @param red [float] The red intensity.
    # @param green [float] The green intensity.
    # @param blue [float] The blue intensity.
    #
    def initialize(red = 0, green = 0, blue = 0)
      super()
      if red < 0.0 || red > 1.0 || green < 0.0 || green > 1.0 || blue < 0.0 || blue > 1.0
        Raise "RGB values must be from 0.0 to 1.0."
      end

      @red = red
      @green = green
      @blue = blue
      @_color_string = "rgb(#{red},#{green},#{blue})"
    end

    def self.create_rgb_color(color_string = nil)
      rgb_color = RgbColor.new
      rgb_color._color_string = color_string
      rgb_color
    end

    #
    # Gets the color red.
    #
    def self.red
      RgbColor.create_rgb_color("Red")
    end

    #
    # Gets the color blue.
    #
    def self.blue
      RgbColor.create_rgb_color("Blue")
    end

    #
    # Gets the color green.
    #
    def self.green
      RgbColor.create_rgb_color("Green")
    end

    #
    # Gets the color black.
    #
    def self.black
      RgbColor.create_rgb_color("Black")
    end

    #
    # Gets the color silver.
    #
    def self.silver
      RgbColor.create_rgb_color("Silver")
    end

    #
    # Gets the color dark gray.
    #
    def self.dark_gray
      RgbColor.create_rgb_color("DarkGray")
    end

    #
    # Gets the color gray.
    #
    def self.gray
      RgbColor.create_rgb_color("Gray")
    end

    #
    # Gets the color dim gray.
    #
    def self.dim_gray
      RgbColor.create_rgb_color("DimGray")
    end

    #
    # Gets the color white.
    #
    def self.white
      RgbColor.create_rgb_color("White")
    end

    #
    # Gets the color lime.
    #
    def self.lime
      RgbColor.create_rgb_color("Lime")
    end

    #
    # Gets the color aqua.
    #
    def self.aqua
      RgbColor.create_rgb_color("Aqua")
    end

    #
    # Gets the color purple.
    #
    def self.purple
      RgbColor.create_rgb_color("Purple")
    end

    #
    # Gets the color cyan.
    #
    def self.cyan
      RgbColor.create_rgb_color("Cyan")
    end

    #
    # Gets the color magenta.
    #
    def self.magenta
      RgbColor.create_rgb_color("Magenta")
    end

    #
    # Gets the color yellow.
    #
    def self.yellow
      RgbColor.create_rgb_color("Yellow")
    end

    #
    # Gets the color alice blue.
    #
    def self.alice_blue
      RgbColor.create_rgb_color("AliceBlue")
    end

    #
    # Gets the color antique white.
    #
    def self.antique_white
      RgbColor.create_rgb_color("AntiqueWhite")
    end

    #
    # Gets the color aquamarine.
    #
    def self.aquamarine
      RgbColor.create_rgb_color("Aquamarine")
    end

    #
    # Gets the color azure.
    #
    def self.azure
      RgbColor.create_rgb_color("Azure")
    end

    #
    # Gets the color beige.
    #
    def self.beige
      RgbColor.create_rgb_color("Beige")
    end

    #
    # Gets the color bisque.
    #
    def self.bisque
      RgbColor.create_rgb_color("Bisque")
    end

    #
    # Gets the color blanched almond.
    #
    def self.blanched_almond
      RgbColor.create_rgb_color("BlanchedAlmond")
    end

    #
    # Gets the color blue violet.
    #
    def self.blue_violet
      RgbColor.create_rgb_color("BlueViolet")
    end

    #
    # Gets the color brown.
    #
    def self.brown
      RgbColor.create_rgb_color("Brown")
    end

    #
    # Gets the color burly wood.
    #
    def self.burly_wood
      RgbColor.create_rgb_color("BurlyWood")
    end

    #
    # Gets the color cadet blue.
    #
    def self.cadet_blue
      RgbColor.create_rgb_color("CadetBlue")
    end

    #
    # Gets the color chartreuse.
    #
    def self.chartreuse
      RgbColor.create_rgb_color("Chartreuse")
    end

    #
    # Gets the color chocolate.
    #
    def self.chocolate
      RgbColor.create_rgb_color("Chocolate")
    end

    #
    # Gets the color coral.
    #
    def self.coral
      RgbColor.create_rgb_color("Coral")
    end

    #
    # Gets the color cornflower blue.
    #
    def self.cornflower_blue
      RgbColor.create_rgb_color("CornflowerBlue")
    end

    #
    # Gets the color cornsilk.
    #
    def self.cornsilk
      RgbColor.create_rgb_color("Cornsilk")
    end

    #
    # Gets the color crimson.
    #
    def self.crimson
      RgbColor.create_rgb_color("Crimson")
    end

    #
    # Gets the color dark blue.
    #
    def self.dark_blue
      RgbColor.create_rgb_color("DarkBlue")
    end

    #
    # Gets the color dark cyan.
    #
    def self.dark_cyan
      RgbColor.create_rgb_color("DarkCyan")
    end

    #
    # Gets the color dark golden rod.
    #
    def self.dark_golden_rod
      RgbColor.create_rgb_color("DarkGoldenRod")
    end

    #
    # Gets the color dark green.
    #
    def self.dark_green
      RgbColor.create_rgb_color("DarkGreen")
    end

    #
    # Gets the color dark khaki.
    #
    def self.dark_khaki
      RgbColor.create_rgb_color("DarkKhaki")
    end

    #
    # Gets the color dark magenta.
    #
    def self.dark_magenta
      RgbColor.create_rgb_color("DarkMagenta")
    end

    #
    # Gets the color dark olive green.
    #
    def self.dark_olive_green
      RgbColor.create_rgb_color("DarkOliveGreen")
    end

    #
    # Gets the color dark orange.
    #
    def self.dark_orange
      RgbColor.create_rgb_color("DarkOrange")
    end

    #
    # Gets the color dark orchid.
    #
    def self.dark_orchid
      RgbColor.create_rgb_color("DarkOrchid")
    end

    #
    # Gets the color dark red.
    #
    def self.dark_red
      RgbColor.create_rgb_color("DarkRed")
    end

    #
    # Gets the color dark salmon.
    #
    def self.dark_salmon
      RgbColor.create_rgb_color("DarkSalmon")
    end

    #
    # Gets the color dark sea green.
    #
    def self.dark_sea_green
      RgbColor.create_rgb_color("DarkSeaGreen")
    end

    #
    # Gets the color dark slate blue.
    #
    def self.dark_slate_blue
      RgbColor.create_rgb_color("DarkSlateBlue")
    end

    #
    # Gets the color dark slate gray.
    #
    def self.dark_slate_gray
      RgbColor.create_rgb_color("DarkSlateGray")
    end

    #
    # Gets the color dark turquoise.
    #
    def self.dark_turquoise
      RgbColor.create_rgb_color("DarkTurquoise")
    end

    #
    # Gets the color dark violet.
    #
    def self.dark_violet
      RgbColor.create_rgb_color("DarkViolet")
    end

    #
    # Gets the color deep pink.
    #
    def self.deep_pink
      RgbColor.create_rgb_color("DeepPink")
    end

    #
    # Gets the color deep sky blue.
    #
    def self.deep_sky_blue
      RgbColor.create_rgb_color("DeepSkyBlue")
    end

    #
    # Gets the color dodger blue.
    #
    def self.dodger_blue
      RgbColor.create_rgb_color("DodgerBlue")
    end

    #
    # Gets the color feldspar.
    #
    def self.feldspar
      RgbColor.create_rgb_color("Feldspar")
    end

    #
    # Gets the color fire brick.
    #
    def self.fire_brick
      RgbColor.create_rgb_color("FireBrick")
    end

    #
    # Gets the color floral white.
    #
    def self.floral_white
      RgbColor.create_rgb_color("FloralWhite")
    end

    #
    # Gets the color forest green.
    #
    def self.forest_green
      RgbColor.create_rgb_color("ForestGreen")
    end

    #
    # Gets the color fuchsia.
    #
    def self.fuchsia
      RgbColor.create_rgb_color("Fuchsia")
    end

    #
    # Gets the color ghost white.
    #
    def self.ghost_white
      RgbColor.create_rgb_color("GhostWhite")
    end

    #
    # Gets the color gold.
    #
    def self.gold
      RgbColor.create_rgb_color("Gold")
    end

    #
    # Gets the color golden rod.
    #
    def self.golden_rod
      RgbColor.create_rgb_color("GoldenRod")
    end

    #
    # Gets the color green yellow.
    #
    def self.green_yellow
      RgbColor.create_rgb_color("GreenYellow")
    end

    #
    # Gets the color honey dew.
    #
    def self.honey_dew
      RgbColor.create_rgb_color("HoneyDew")
    end

    #
    # Gets the color hot pink.
    #
    def self.hot_pink
      RgbColor.create_rgb_color("HotPink")
    end

    #
    # Gets the color indian red.
    #
    def self.indian_red
      RgbColor.create_rgb_color("IndianRed")
    end

    #
    # Gets the color indigo.
    #
    def self.indigo
      RgbColor.create_rgb_color("Indigo")
    end

    #
    # Gets the color ivory.
    #
    def self.ivory
      RgbColor.create_rgb_color("Ivory")
    end

    #
    # Gets the color khaki.
    #
    def self.khaki
      RgbColor.create_rgb_color("Khaki")
    end

    #
    # Gets the color lavender.
    #
    def self.lavender
      RgbColor.create_rgb_color("Lavender")
    end

    #
    # Gets the color lavender blush.
    #
    def self.lavender_blush
      RgbColor.create_rgb_color("LavenderBlush")
    end

    #
    # Gets the color lawn Green.
    #
    def self.lawn_green
      RgbColor.create_rgb_color("LawnGreen")
    end

    #
    # Gets the color lemon chiffon.
    #
    def self.lemon_chiffon
      RgbColor.create_rgb_color("LemonChiffon")
    end

    #
    # Gets the color light blue.
    #
    def self.light_blue
      RgbColor.create_rgb_color("LightBlue")
    end

    #
    # Gets the color light coral.
    #
    def self.light_coral
      RgbColor.create_rgb_color("LightCoral")
    end

    #
    # Gets the color light cyan.
    #
    def self.light_cyan
      RgbColor.create_rgb_color("LightCyan")
    end

    #
    # Gets the color light golden rod yellow.
    #
    def self.light_golden_rod_yellow
      RgbColor.create_rgb_color("LightGoldenRodYellow")
    end

    #
    # Gets the color light grey.
    #
    def self.light_grey
      RgbColor.create_rgb_color("LightGrey")
    end

    #
    # Gets the color light green.
    #
    def self.light_green
      RgbColor.create_rgb_color("LightGreen")
    end

    #
    # Gets the color light pink.
    #
    def self.light_pink
      RgbColor.create_rgb_color("LightPink")
    end

    #
    # Gets the color light salmon.
    #
    def self.light_salmon
      RgbColor.create_rgb_color("LightSalmon")
    end

    #
    # Gets the color light sea green.
    #
    def self.light_sea_green
      RgbColor.create_rgb_color("LightSeaGreen")
    end

    #
    # Gets the color light sky blue.
    #
    def self.light_sky_blue
      RgbColor.create_rgb_color("LightSkyBlue")
    end

    #
    # Gets the color light slate blue.
    #
    def self.light_slate_blue
      RgbColor.create_rgb_color("LightSlateBlue")
    end

    #
    # Gets the color light slate gray.
    #
    def self.light_slate_gray
      RgbColor.create_rgb_color("LightSlateGray")
    end

    #
    # Gets the color light steel blue.
    #
    def self.light_steel_blue
      RgbColor.create_rgb_color("LightSteelBlue")
    end

    #
    # Gets the color light yellow.
    #
    def self.light_yellow
      RgbColor.create_rgb_color("LightYellow")
    end

    #
    # Gets the color lime green.
    #
    def self.lime_green
      RgbColor.create_rgb_color("LimeGreen")
    end

    #
    # Gets the color linen.
    #
    def self.linen
      RgbColor.create_rgb_color("Linen")
    end

    #
    # Gets the color maroon.
    #
    def self.maroon
      RgbColor.create_rgb_color("Maroon")
    end

    #
    # Gets the color medium aqua marine.
    #
    def self.medium_aqua_marine
      RgbColor.create_rgb_color("MediumAquaMarine")
    end

    #
    # Gets the color medium blue.
    #
    def self.medium_blue
      RgbColor.create_rgb_color("MediumBlue")
    end

    #
    # Gets the color medium orchid.
    #
    def self.medium_orchid
      RgbColor.create_rgb_color("MediumOrchid")
    end

    #
    # Gets the color medium purple.
    #
    def self.medium_purple
      RgbColor.create_rgb_color("MediumPurple")
    end

    #
    # Gets the color medium sea green.
    #
    def self.medium_sea_green
      RgbColor.create_rgb_color("MediumSeaGreen")
    end

    #
    # Gets the color medium slate blue.
    #
    def self.medium_slate_blue
      RgbColor.create_rgb_color("MediumSlateBlue")
    end

    #
    # Gets the color medium spring green.
    #
    def self.medium_spring_green
      RgbColor.create_rgb_color("MediumSpringGreen")
    end

    #
    # Gets the color medium turquoise.
    #
    def self.medium_turquoise
      RgbColor.create_rgb_color("MediumTurquoise")
    end

    #
    # Gets the color medium violet red.
    #
    def self.medium_violet_red
      RgbColor.create_rgb_color("MediumVioletRed")
    end

    #
    # Gets the color midnight blue.
    #
    def self.midnight_blue
      RgbColor.create_rgb_color("MidnightBlue")
    end

    #
    # Gets the color mint cream.
    #
    def self.mint_cream
      RgbColor.create_rgb_color("MintCream")
    end

    #
    # Gets the color misty rose.
    #
    def self.misty_rose
      RgbColor.create_rgb_color("MistyRose")
    end

    #
    # Gets the color moccasin.
    #
    def self.moccasin
      RgbColor.create_rgb_color("Moccasin")
    end

    #
    # Gets the color navajo white.
    #
    def self.navajo_white
      RgbColor.create_rgb_color("NavajoWhite")
    end

    #
    # Gets the color navy.
    #
    def self.navy
      RgbColor.create_rgb_color("Navy")
    end

    #
    # Gets the color old lace.
    #
    def self.old_lace
      RgbColor.create_rgb_color("OldLace")
    end

    #
    # Gets the color olive.
    #
    def self.olive
      RgbColor.create_rgb_color("Olive")
    end

    #
    # Gets the color olive drab.
    #
    def self.olive_drab
      RgbColor.create_rgb_color("OliveDrab")
    end

    #
    # Gets the color gainsboro.
    #
    def self.gainsboro
      RgbColor.create_rgb_color("Gainsboro")
    end

    #
    # Gets the color orange.
    #
    def self.orange
      RgbColor.create_rgb_color("Orange")
    end

    #
    # Gets the color orange red.
    #
    def self.orange_red
      RgbColor.create_rgb_color("OrangeRed")
    end

    #
    # Gets the color orchid.
    #
    def self.orchid
      RgbColor.create_rgb_color("Orchid")
    end

    #
    # Gets the color pale golden rod.
    #
    def self.pale_golden_rod
      RgbColor.create_rgb_color("PaleGoldenRod")
    end

    #
    # Gets the color pale green.
    #
    def self.pale_green
      RgbColor.create_rgb_color("PaleGreen")
    end

    #
    # Gets the color pale turquoise.
    #
    def self.pale_turquoise
      RgbColor.create_rgb_color("PaleTurquoise")
    end

    #
    # Gets the color pale violet red.
    #
    def self.pale_violet_red
      RgbColor.create_rgb_color("PaleVioletRed")
    end

    #
    # Gets the color papaya whip.
    #
    def self.papaya_whip
      RgbColor.create_rgb_color("PapayaWhip")
    end

    #
    # Gets the color peach puff.
    #
    def self.peach_puff
      RgbColor.create_rgb_color("PeachPuff")
    end

    #
    # Gets the color peru.
    #
    def self.peru
      RgbColor.create_rgb_color("Peru")
    end

    #
    # Gets the color pink.
    #
    def self.pink
      RgbColor.create_rgb_color("Pink")
    end

    #
    # Gets the color plum.
    #
    def self.plum
      RgbColor.create_rgb_color("Plum")
    end

    #
    # Gets the color powder blue.
    #
    def self.powder_blue
      RgbColor.create_rgb_color("PowderBlue")
    end

    #
    # Gets the color rosy brown.
    #
    def self.rosy_brown
      RgbColor.create_rgb_color("RosyBrown")
    end

    #
    # Gets the color royal blue.
    #
    def self.royal_blue
      RgbColor.create_rgb_color("RoyalBlue")
    end

    #
    # Gets the color saddle brown.
    #
    def self.saddle_brown
      RgbColor.create_rgb_color("SaddleBrown")
    end

    #
    # Gets the color salmon.
    #
    def self.salmon
      RgbColor.create_rgb_color("Salmon")
    end

    #
    # Gets the color sandy brown.
    #
    def self.sandy_brown
      RgbColor.create_rgb_color("SandyBrown")
    end

    #
    # Gets the color sea green.
    #
    def self.sea_green
      RgbColor.create_rgb_color("SeaGreen")
    end

    #
    # Gets the color sea shell.
    #
    def self.sea_shell
      RgbColor.create_rgb_color("SeaShell")
    end

    #
    # Gets the color sienna.
    #
    def self.sienna
      RgbColor.create_rgb_color("Sienna")
    end

    #
    # Gets the color sky blue.
    #
    def self.sky_blue
      RgbColor.create_rgb_color("SkyBlue")
    end

    #
    # Gets the color slate blue.
    #
    def self.slate_blue
      RgbColor.create_rgb_color("SlateBlue")
    end

    #
    # Gets the color slate gray.
    #
    def self.slate_gray
      RgbColor.create_rgb_color("SlateGray")
    end

    #
    # Gets the color snow.
    #
    def self.snow
      RgbColor.create_rgb_color("Snow")
    end

    #
    # Gets the color spring green.
    #
    def self.spring_green
      RgbColor.create_rgb_color("SpringGreen")
    end

    #
    # Gets the color steel blue.
    #
    def self.steel_blue
      RgbColor.create_rgb_color("SteelBlue")
    end

    #
    # Gets the color Tan.
    #
    def self.tan
      RgbColor.create_rgb_color("Tan")
    end

    #
    # Gets the color teal.
    #
    def self.teal
      RgbColor.create_rgb_color("Teal")
    end

    #
    # Gets the color thistle.
    #
    def self.thistle
      RgbColor.create_rgb_color("Thistle")
    end

    #
    # Gets the color tomato.
    #
    def self.tomato
      RgbColor.create_rgb_color("Tomato")
    end

    #
    # Gets the color turquoise.
    #
    def self.turquoise
      RgbColor.create_rgb_color("Turquoise")
    end

    #
    # Gets the color violet.
    #
    def self.violet
      RgbColor.create_rgb_color("Violet")
    end

    #
    # Gets the color violet red.
    #
    def self.violet_red
      RgbColor.create_rgb_color("VioletRed")
    end

    #
    # Gets the color wheat.
    #
    def self.wheat
      RgbColor.create_rgb_color("Wheat")
    end

    #
    # Gets the color white smoke.
    #
    def self.white_smoke
      RgbColor.create_rgb_color("WhiteSmoke")
    end

    #
    # Gets the color yellow green.
    #
    def self.yellow_green
      RgbColor.create_rgb_color("YellowGreen")
    end

    def to_json(_options = {})
      # json_array=array()

      if @_color_string != nil
        @_color_string
      else
        "rgb(#{@red},#{@green},#{@blue})"
      end
    end
  end
end
