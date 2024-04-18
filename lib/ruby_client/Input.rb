module DynamicPDFApi
  require_relative 'InputType'
  require_relative 'Resource'

  #
  # Represents the base class for inputs.
  #
  class Input
    def initialize(resource = nil)
      @_resources = []
      @template = nil
      @_type = nil
      @_template_id = nil

      if resource.is_a?(String)
        @resource_name = resource
      elsif !resource.nil?
        @_resources << resource
        @resource_name = resource.resource_name
      end

      @id = SecureRandom.uuid
    end

    attr_accessor :_type, :_template_id, :_resources

    #
    # Gets or sets the resource name.
    #
    attr_accessor :resource_name

    #
    # Gets or sets the id.
    #
    attr_accessor :id

    #
    # Gets or sets the template.
    #
    def set_template(template)
      @template = template
      @_template_id = template.id
    end

    def get_template
      @template
    end

    def to_json(_options = {})
      JSON.pretty_generate({})
    end
  end
end
