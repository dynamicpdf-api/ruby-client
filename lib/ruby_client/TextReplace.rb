module DynamicPDFApi
  class TextReplace

    #
    # Represents the find and replace values and its options.
    #
    # @param name="text">Text to find.
    # @param name="replaceText">Text to replace.
    # @param name="matchCase">True value will make the search operation case sensitive.
    def initialize(text, replaceText, matchCase = false)
      @text = text
      @replace_text = replaceText
      @match_case = matchCase
    end

    #
    # Gets or sets the Find Text value. This string will be replaced with ReplaceText during conversion.
    #
    attr_accessor :text

    #
    # Gets or sets ReplaceText value.This string will replace the Text during conversion.
    #
    attr_accessor :replace_text

    #
    # If True, the search operation will be case sensitive.
    #
    attr_accessor :match_case

    def to_json(_options = {})
      json_array = {}

      json_array["text"] = @text

      json_array["replaceText"] = @replace_text unless @replace_text.nil?

      json_array["matchCase"] = @match_case unless @match_case.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
