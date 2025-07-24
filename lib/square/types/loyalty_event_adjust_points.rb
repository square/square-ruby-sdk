# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Provides metadata when the event `type` is `ADJUST_POINTS`.
  class LoyaltyEventAdjustPoints
  # @return [String] The Square-assigned ID of the [loyalty program](entity:LoyaltyProgram).
    attr_reader :loyalty_program_id
  # @return [Integer] The number of points added or removed.
    attr_reader :points
  # @return [String] The reason for the adjustment of points.
    attr_reader :reason
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param loyalty_program_id [String] The Square-assigned ID of the [loyalty program](entity:LoyaltyProgram).
    # @param points [Integer] The number of points added or removed.
    # @param reason [String] The reason for the adjustment of points.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyEventAdjustPoints]
    def initialize(loyalty_program_id: OMIT, points:, reason: OMIT, additional_properties: nil)
      @loyalty_program_id = loyalty_program_id if loyalty_program_id != OMIT
      @points = points
      @reason = reason if reason != OMIT
      @additional_properties = additional_properties
      @_field_set = { "loyalty_program_id": loyalty_program_id, "points": points, "reason": reason }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyEventAdjustPoints
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyEventAdjustPoints]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      loyalty_program_id = parsed_json["loyalty_program_id"]
      points = parsed_json["points"]
      reason = parsed_json["reason"]
      new(
        loyalty_program_id: loyalty_program_id,
        points: points,
        reason: reason,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyEventAdjustPoints to a JSON object
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
      obj.loyalty_program_id&.is_a?(String) != false || raise("Passed value for field obj.loyalty_program_id is not the expected type, validation failed.")
      obj.points.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.reason&.is_a?(String) != false || raise("Passed value for field obj.reason is not the expected type, validation failed.")
    end
  end
end