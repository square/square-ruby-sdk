# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# The range of a number value between the specified lower and upper bounds.
  class Range
  # @return [String] The lower bound of the number range. At least one of `min` or `max` must be
#  specified.
#  If unspecified, the results will have no minimum value.
    attr_reader :min
  # @return [String] The upper bound of the number range. At least one of `min` or `max` must be
#  specified.
#  If unspecified, the results will have no maximum value.
    attr_reader :max
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param min [String] The lower bound of the number range. At least one of `min` or `max` must be
#  specified.
#  If unspecified, the results will have no minimum value.
    # @param max [String] The upper bound of the number range. At least one of `min` or `max` must be
#  specified.
#  If unspecified, the results will have no maximum value.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::Range]
    def initialize(min: OMIT, max: OMIT, additional_properties: nil)
      @min = min if min != OMIT
      @max = max if max != OMIT
      @additional_properties = additional_properties
      @_field_set = { "min": min, "max": max }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Range
    #
    # @param json_object [String] 
    # @return [SquareApiClient::Range]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      min = parsed_json["min"]
      max = parsed_json["max"]
      new(
        min: min,
        max: max,
        additional_properties: struct
      )
    end
# Serialize an instance of Range to a JSON object
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
      obj.min&.is_a?(String) != false || raise("Passed value for field obj.min is not the expected type, validation failed.")
      obj.max&.is_a?(String) != false || raise("Passed value for field obj.max is not the expected type, validation failed.")
    end
  end
end