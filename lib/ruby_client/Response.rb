module DynamicPDFApi
  #
  # Represents the base class for response.
  #
  class Response
    def initialize
      @_is_successful = false
      @_error_message = nil
      @_error_id = nil
      @_status_code = nil
      @_error_json = nil
    end

    #
    # Gets the boolean, indicating the response's status.
    #
    attr_accessor :is_successful

    #
    # Gets the error message.
    #
    attr_accessor :error_message

    #
    # Gets the error id.
    #
    attr_accessor :error_id

    #
    # Gets the status code.
    #
    attr_accessor :status_code

    #
    # Gets the error json.
    #
    attr_accessor :error_json
  end
end
