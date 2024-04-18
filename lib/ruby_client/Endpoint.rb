module DynamicPDFApi
  #
  # Represents the base class for endpoint and has settings for base url, api key and creates a rest request
  # object.
  #
  class Endpoint
    def initialize
      @_client = nil
      @enable_logging = false
      @api_key = @@default_api_key
      @base_url = @@default_base_url
    end

    attr_accessor :_endpoint_name

    #
    # Gets or sets default base url.
    #
    @@default_base_url = 'https://api.dynamicpdf.com'

    #
    # Gets or sets default api key.
    #
    @@default_api_key = nil

    #
    # Gets or sets base url for the api.
    #
    attr_accessor :base_url

    #
    # Gets or sets api key.
    #
    attr_accessor :api_key

    def init; end
  end
end
