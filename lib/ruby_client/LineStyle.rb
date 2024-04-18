module DynamicPDFApi
  #
  # Represents a style of line.
  #
  class LineStyle
    #
    # Initializes a new instance of the LineStyle class.
    #
    # @param line [Array] The array specifying the line style.
    # @param dash_phase [float] The phase of the line style.
    #
    def initialize(line, dash_phase = 0)
      if line.is_a?(Array)
        str_line_style = '['
        (0..(line.length - 1)).each do |i|
          val = line[i]
          str_line_style = if i == (line.length - 1)
                             str_line_style + format('%.2f', val)
                           else
                             "#{str_line_style}#{format('%.2f', val)},"
                           end
        end
        str_line_style += ']'
        str_line_style += format('%.2f', dash_phase) if dash_phase != 0
        @_line_style_string = str_line_style
      else
        @_line_style_string = line
      end
    end

    attr_accessor :_line_style_string

    #
    # Gets a solid line.
    #
    def self.solid
      LineStyle.new('solid')
    end

    #
    # Gets a dotted line.
    #
    def self.dots
      LineStyle.new('dots')
    end

    #
    # Gets a line with small dashes.
    #
    def self.dash_small
      LineStyle.new('dashSmall')
    end

    #
    # Gets a dashed line.
    #
    def self.dash
      LineStyle.new('dash')
    end

    #
    # Gets a line with large dashes.
    #
    def self.dash_large
      LineStyle.new('dashLarge')
    end

    #
    # Gets a invisible line.
    #
    def self.none
      LineStyle.new('none')
    end

    def to_json(_options = {})
      JSON.pretty_generate({})
    end
  end
end
