module DynamicPDFApi
  class OutputSize
    def initialize(larger, smaller)
      @larger = larger
      @smaller = smaller
    end

    attr_accessor :larger, :smaller
  end
end
