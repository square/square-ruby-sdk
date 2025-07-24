# frozen_string_literal: true
require_relative "error"
require_relative "loyalty_program"
require "ostruct"
require "json"

module square.rb
# A response that contains the loyalty program.
  class GetLoyaltyProgramResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::LoyaltyProgram] The loyalty program that was requested.
    attr_reader :program
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param program [square.rb::LoyaltyProgram] The loyalty program that was requested.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetLoyaltyProgramResponse]
    def initialize(errors: OMIT, program: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @program = program if program != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "program": program }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetLoyaltyProgramResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetLoyaltyProgramResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["program"].nil?
        program = parsed_json["program"].to_json
        program = square.rb::LoyaltyProgram.from_json(json_object: program)
      else
        program = nil
      end
      new(
        errors: errors,
        program: program,
        additional_properties: struct
      )
    end
# Serialize an instance of GetLoyaltyProgramResponse to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.program.nil? || square.rb::LoyaltyProgram.validate_raw(obj: obj.program)
    end
  end
end