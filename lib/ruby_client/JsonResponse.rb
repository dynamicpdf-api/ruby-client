module DynamicPDFApi
  require_relative 'Response'

  #
  # Represents the base class for json response.
  #
  class JsonResponse < Response
    def initialize(json_content = nil)
      super()
      @json_content = json_content
    end

    #
    # Gets the json content.
    #
    attr_accessor :json_content
  end
end
