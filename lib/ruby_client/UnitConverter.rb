require_relative "PageSize"

module DynamicPDFApi
  #
  # Represents a html input.
  #
  class UnitConverter
    def initialize
    end

    #
    # Method to convert inches to points.
    #
    # @param  name="size">Size in inches.
    # @returns Size in points.
    def self.inches_to_points(size)
      size * 72.0
    end

    #
    # Method to convert millimeters to points.
    #
    # @param  name="size">Size in millimeters.
    # @returns Size in points.
    def self.millimeters_to_points(size)
      size * 2.8346456692913385826771653543307
    end

    def self.get_paper_size(size)
      case size

      when PageSize::LETTER
        @smaller = inches_to_points(8.5)
        @larger = inches_to_points(11)
      when PageSize::LEGAL
        @smaller = inches_to_points(8.5)
        @larger = inches_to_points(14)
      when PageSize::EXECUTIVE
        @smaller = inches_to_points(7.25)
        @larger = inches_to_points(10.5)
      when PageSize::TABLOID
        @smaller = inches_to_points(11)
        @larger = inches_to_points(17)
      when PageSize::ENVELOPE10
        @smaller = inches_to_points(4.125)
        @larger = inches_to_points(9.5)
      when PageSize::ENVELOPEMONARCH
        @smaller = inches_to_points(3.875)
        @larger = inches_to_points(7.5)
      when PageSize::FOLIO
        @smaller = inches_to_points(8.5)
        @larger = inches_to_points(13)
      when PageSize::STATEMENT
        @smaller = inches_to_points(5.5)
        @larger = inches_to_points(8.5)
      when PageSize::A4
        @smaller = millimeters_to_points(210)
        @larger = millimeters_to_points(297)
      when PageSize::A5
        @smaller = millimeters_to_points(148)
        @larger = millimeters_to_points(210)
      when PageSize::B4
        @smaller = millimeters_to_points(250)
        @larger = millimeters_to_points(353)
      when PageSize::B5
        @smaller = millimeters_to_points(176)
        @larger = millimeters_to_points(250)
      when PageSize::A3
        @smaller = millimeters_to_points(297)
        @larger = millimeters_to_points(420)
      when PageSize::B3
        @smaller = millimeters_to_points(353)
        @larger = millimeters_to_points(500)
      when PageSize::A6
        @smaller = millimeters_to_points(105)
        @larger = millimeters_to_points(148)
      when PageSize::B5JIS
        @smaller = millimeters_to_points(182)
        @larger = millimeters_to_points(257)
      when PageSize::ENVELOPEDL
        @smaller = millimeters_to_points(110)
        @larger = millimeters_to_points(220)
      when PageSize::ENVELOPEC5
        @smaller = millimeters_to_points(162)
        @larger = millimeters_to_points(229)
      when PageSize::ENVELOPEB5
        @smaller = millimeters_to_points(176)
        @larger = millimeters_to_points(250)
      when PageSize::PRC16K
        @smaller = millimeters_to_points(146)
        @larger = millimeters_to_points(215)
      when PageSize::PRC32K
        @smaller = millimeters_to_points(97)
        @larger = millimeters_to_points(151)
      when PageSize::QUATRO
        @smaller = millimeters_to_points(215)
        @larger = millimeters_to_points(275)
      when PageSize::DOUBLEPOSTCARD
        @smaller = millimeters_to_points(148.0)
        @larger = millimeters_to_points(200.0)
      when PageSize::POSTCARD
        @smaller = inches_to_points(3.94)
        @larger = inches_to_points(5.83)
      else
        @smaller = inches_to_points(8.5)
        @larger = inches_to_points(11)
      end
      OutputSize.new(@larger, @smaller)
    end
  end
end
