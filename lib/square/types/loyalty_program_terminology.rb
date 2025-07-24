# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents the naming used for loyalty points.
  class LoyaltyProgramTerminology
  # @return [String] A singular unit for a point (for example, 1 point is called 1 star).
    attr_reader :one
  # @return [String] A plural unit for point (for example, 10 points is called 10 stars).
    attr_reader :other
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param one [String] A singular unit for a point (for example, 1 point is called 1 star).
    # @param other [String] A plural unit for point (for example, 10 points is called 10 stars).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyProgramTerminology]
    def initialize(one:, other:, additional_properties: nil)
      @one = one
      @other = other
      @additional_properties = additional_properties
      @_field_set = { "one": one, "other": other }
    end
# Deserialize a JSON object to an instance of LoyaltyProgramTerminology
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyProgramTerminology]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      one = parsed_json["one"]
      other = parsed_json["other"]
      new(
        one: one,
        other: other,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyProgramTerminology to a JSON object
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
      obj.one.is_a?(String) != false || raise("Passed value for field obj.one is not the expected type, validation failed.")
      obj.other.is_a?(String) != false || raise("Passed value for field obj.other is not the expected type, validation failed.")
    end
  end
end