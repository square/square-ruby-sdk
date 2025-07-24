# frozen_string_literal: true
require_relative "error"
require_relative "loyalty_program"
require "ostruct"
require "json"

module SquareApiClient
# A response that contains all loyalty programs.
  class ListLoyaltyProgramsResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::LoyaltyProgram>] A list of `LoyaltyProgram` for the merchant.
    attr_reader :programs
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param programs [Array<SquareApiClient::LoyaltyProgram>] A list of `LoyaltyProgram` for the merchant.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ListLoyaltyProgramsResponse]
    def initialize(errors: OMIT, programs: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @programs = programs if programs != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "programs": programs }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListLoyaltyProgramsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ListLoyaltyProgramsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      programs = parsed_json["programs"]&.map do | item |
  item = item.to_json
  SquareApiClient::LoyaltyProgram.from_json(json_object: item)
end
      new(
        errors: errors,
        programs: programs,
        additional_properties: struct
      )
    end
# Serialize an instance of ListLoyaltyProgramsResponse to a JSON object
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
      obj.programs&.is_a?(Array) != false || raise("Passed value for field obj.programs is not the expected type, validation failed.")
    end
  end
end