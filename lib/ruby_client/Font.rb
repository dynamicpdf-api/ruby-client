module DynamicPDFApi
  require_relative "FontResource"
  require_relative "FullNameTable"

  #
  # Represents font.
  #
  class Font
    @font_details = []
    @load_required = true
    @lock = Mutex.new

    # For Windows fonts
    windir = ENV["WINDIR"]
    if windir && !windir.empty?
      @path_to_fonts_resource_directory = File.join(windir, "Fonts")
    else
      @path_to_fonts_resource_directory = nil
    end

    #
    # Initializes a new instance of the Font class using the font name that is present in the cloud resource
    # manager.
    #
    # @param cloud_resource_name [String] The font name present in the cloud resource manager.
    #
    def initialize(cloud_resource_name = nil)
      @data = {}
      @_resource = nil
      @embed = nil
      @subset = nil

      @resource_name = cloud_resource_name
      @_name = SecureRandom.uuid
    end

    def self.create_font(font_resource = nil, resource_name = nil)
      font = Font.new
      font._resource = font_resource
      font.resource_name = resource_name

      font._name = SecureRandom.uuid
      font
    end

    attr_accessor :_name, :_resource

    #
    # Gets or sets a boolean indicating whether to embed the font.
    #
    attr_accessor :embed

    #
    # Gets or sets a boolean indicating whether to subset embed the font.
    #
    attr_accessor :subset

    #
    # Gets or sets a name for the font resource.
    #
    attr_accessor :resource_name

    #
    # Gets the Times Roman core font with Latin 1 encoding.
    #
    def self.times_roman
      @@times_roman = Font.new if @@times_roman.nil?

      @@times_roman._name = "timesRoman"
      @@times_roman
    end

    #
    # Gets the Times Bold core font with Latin 1 encoding.
    #
    def self.times_bold
      @@times_bold = Font.new if @@times_bold.nil?

      @@times_bold._name = "timesBold"
      @@times_bold
    end

    #
    # Gets the Times Italic core font with Latin 1 encoding.
    #
    def self.times_italic
      @@times_italic = Font.new if @@times_italic.nil?

      @@times_italic._name = "timesItalic"
      @@times_italic
    end

    #
    # Gets the Times Bold Italic core font with Latin 1 encoding.
    #
    def self.times_bold_italic
      @@times_bold_italic = Font.new if @@times_bold_italic.nil?

      @@times_bold_italic._name = "timesBoldItalic"
      @@times_bold_italic
    end

    #
    # Gets the Helvetica core font with Latin 1 encoding.
    #
    def self.helvetica
      @@helvetica = Font.new if @@helvetica.nil?

      @@helvetica._name = "helvetica"
      @@helvetica
    end

    #
    # Gets the Helvetica Bold core font with Latin 1 encoding.
    #
    def self.helvetica_bold
      @@helvetica_bold = Font.new if @@helvetica_bold.nil?

      @@helvetica_bold._name = "helveticaBold"
      @@helvetica_bold
    end

    #
    # Gets the Helvetica Oblique core font with Latin 1 encoding.
    #
    def self.helvetica_oblique
      @@helvetica_oblique = Font.new if @@helvetica_oblique.nil?

      @@helvetica_oblique._name = "helveticaOblique"
      @@helvetica_oblique
    end

    #
    # Gets the Helvetica Bold Oblique core font with Latin 1 encoding.
    #
    def self.helvetica_bold_oblique
      @@helvetica_boldOblique = Font.new if @@helvetica_boldOblique.nil?

      @@helvetica_boldOblique._name = "helveticaBoldOblique"
      @@helvetica_boldOblique
    end

    #
    # Gets the Courier core font with Latin 1 encoding.
    #
    def self.courier
      @@courier = Font.new if @@courier.nil?

      @@courier._name = "courier"
      @@courier
    end

    #
    # Gets the Courier Bold core font with Latin 1 encoding.
    #
    def self.courier_bold
      @@courier_bold = Font.new if @@courier_bold.nil?

      @@courier_bold._name = "courierBold"
      @@courier_bold
    end

    #
    # Gets the Courier Oblique core font with Latin 1 encoding.
    #
    def self.courier_oblique
      @@courier_oblique = Font.new if @@courier_oblique.nil?

      @@courier_oblique._name = "courierOblique"
      @@courier_oblique
    end

    #
    # Gets the Courier Bold Oblique core font with Latin 1 encoding.
    #
    def self.courier_bold_oblique
      @@courier_boldOblique = Font.new if @@courier_boldOblique.nil?

      @@courier_boldOblique._name = "courierBoldOblique"
      @@courier_boldOblique
    end

    #
    # Gets the Symbol core font.
    #
    def self.symbol
      @@symbol = Font.new if @@symbol.nil?

      @@symbol._name = "symbol"
      @@symbol
    end

    #
    # Gets the Zapf Dingbats core font.
    #
    def self.zapf_dingbats
      @@zapf_dingbats = Font.new if @@zapf_dingbats.nil?

      @@zapf_dingbats._name = "zapfDingbats"
      @@zapf_dingbats
    end

    #
    # Initializes a new instance of the Font class using the file path of the font and resource name.
    #
    # @param file_path [String] The file path of the font file.
    # @param resource_name [String] The resource name for the font.
    #
    def self.from_file(file_path, resource_name = nil)
      resource = Resource.new(file_path, resource_name)
      Font.create_font(resource, resource.resource_name)
    end

    def self.from_stream(_stream, _resource_name = nil)
      resource = Resource.new(stream, resource_name)
      Font.create_font(resource, resource.resource_name)
    end

    def self.get_google_font_text(name, weight, italic)
      if italic == true
        name + ":" + weight.to_s + "italic"
      else
        name + ":" + weight.to_s
      end
    end

    #
    # Gets the font from the google.
    #
    # @param fontName [string] The name of the google font.
    # @param bold [bold] If true font weight will be taken as 700 otherwise 400.
    # @param italic [italic] The italic property of the font.
    # @returns The font object.
    #
    def self.google(font_name, bold = nil, italic = false)
      font = Font.new()
      if bold == true
        font._name = Font.get_google_font_text(font_name, 700, italic)
      elsif (bold.is_a?(Integer) == true)
        font._name = Font.get_google_font_text(font_name, bold, italic);
      elsif bold == false
        font._name = Font.get_google_font_text(font_name, 400, italic);
      else
        font._name = font_name;
      end
      font
    end

    #
    # Gets the font from the global storage.
    #
    # @param fontName [string] The name of the font to get from the global storage..
    # @returns The font object.
    #
    def self.global(font_name)
      font = Font.new()
      font._name = font_name
      font
    end

    def self.from_system(font_name, resource_name = nil)
      return nil if font_name.nil? || font_name.strip.empty?

      font_name = font_name.gsub(/[- ]/, "")  # Removing the space and - from font_name

      self.load_fonts if @load_required

      @font_details.each do |detail|
        if detail._name.casecmp(font_name).zero?
          font_resource = FontResource.new(detail.file_path, resource_name)
          return Font.create_font(font_resource, font_resource.resource_name)
        end
      end

      nil
    end

    def self.load_fonts
      return unless @load_required
      loaded_any = false

      @lock.synchronize do
        if @path_to_fonts_resource_directory && !@path_to_fonts_resource_directory.empty?
          dir_Info = File.join(@path_to_fonts_resource_directory.gsub("\\", "/"), "*")

          Dir.glob(dir_Info).each do |file_path|
            next unless file_path.downcase.end_with?(".ttf", ".otf")

            File.open(file_path, "rb") do |reader|
              name_table = self.read_font_name_table(reader)

              if name_table && name_table._name && !name_table._name.empty?
                @font_details << FontInformation.new(name_table._name, file_path)
              end
            end
          end
        end
        @load_required = false
      end
    end

    def self.read_font_name_table(reader)
      name_table = nil
      begin
        reader.seek(4, IO::SEEK_SET)
        table_count = (reader.readbyte << 8) | reader.readbyte
        if table_count > 0
          reader.seek(12, IO::SEEK_SET)
          table_directory = reader.read(table_count * 16).b
          (0...table_directory.size).step(16) do |i|
            tag_bytes = table_directory[i, 4]
            tag = tag_bytes.unpack1("V")
            if tag == 1701667182 # "name"
              name_table = FullNameTable.new(reader, table_directory, i)
              break
            end
          end
        end
      rescue => e
        puts "Error in read_font_name_table: #{e.message}"
      end
      name_table
    end

    def to_json(_options = {})
      json_array = {}
      json_array["name"] = @_name unless @_name.nil?

      json_array["embed"] = @embed unless @embed.nil?

      json_array["subset"] = @subset unless @subset.nil?

      json_array["resourceName"] = @resource_name unless @resource_name.nil?

      JSON.pretty_generate(json_array)
    end

    @@times_roman = nil
    @@times_bold = nil
    @@times_italic = nil
    @@times_bold_italic = nil
    @@helvetica = nil
    @@helvetica_bold = nil
    @@helvetica_oblique = nil
    @@helvetica_boldOblique = nil
    @@courier = nil
    @@courier_bold = nil
    @@courier_oblique = nil
    @@courier_boldOblique = nil
    @@symbol = nil
    @@zapf_dingbats = nil
  end
end
