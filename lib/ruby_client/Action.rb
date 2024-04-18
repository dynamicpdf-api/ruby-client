module DynamicPDFApi
  #
  # Base class representing an action to perform tasks in many places such as in outlines, links, buttons
  # etc.
  #
  # UrlAction and GoToAction are derived from Action.
  #
  class Action
    def initialize; end

    def to_json(_options = {})
      JSON.pretty_generate({})
    end
  end
end
