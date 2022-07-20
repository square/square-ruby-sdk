module Square
  # Class for exceptions when there is a schema validation error.
  class ValidationException < StandardError
    attr_reader :reason

    # The constructor.
    # @param [String] The reason for raising an exception.
    def initialize(value, template)
      @reason = "The value #{value} provided doesn't validate against the schema #{template}"
      super(reason)
    end
  end
end
