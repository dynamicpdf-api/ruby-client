module DynamicPDFApi
  #
  # Represents a document template.
  #
  class Template
    #
    # Initializes a new instance of the Template class.
    #
    # @param id [String] The id string representing id for the template.
    #
    def initialize(id)
      @id = if id.nil?
              SecureRandom.uuid
            else
              id
            end
      @elements = []
    end

    #
    # Gets or sets the id for the template.
    #
    attr_accessor :id

    #
    # Gets or sets the elements for the template.
    #
    attr_accessor :elements

    def to_json(_options = {})
      elements = []
      @elements.each do |element|
        str = element unless element.nil?

        elements << str unless str.nil?
      end

      json_array = {}

      json_array['id'] = @id
      json_array['elements'] = @elements

      JSON.pretty_generate(json_array)
    end
  end
end
