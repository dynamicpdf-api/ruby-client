module DynamicPDFApi
  class FontInformation
    attr_reader :_name, :file_path

    def initialize(font_name, file_path)
      @_name = font_name
      @file_path = file_path
    end
  end
end
