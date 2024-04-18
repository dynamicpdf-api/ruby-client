module DynamicPDFApi
  require_relative 'Action'

  #
  # Represents an action linking to an external URL.
  #
  class UrlAction < Action
    #
    # Initializes a new instance of the UrlAction class.
    #
    # @param url [String]  URL the action launches.
    #
    def initialize(url)
      super()
      @url = url
    end

    #
    # Gets or sets the URL launched by the action.
    #
    attr_accessor :url

    def to_json(_options = {})
      json_array = {}

      json_array['url'] = @url unless @url.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
