# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents the metadata for a `POINTS_MULTIPLIER` type of [loyalty promotion
#  incentive](entity:LoyaltyPromotionIncentive).
  class LoyaltyPromotionIncentivePointsMultiplierData
  # @return [Integer] The multiplier used to calculate the number of points earned each time the
#  promotion
#  is triggered. For example, suppose a purchase qualifies for 5 points from the
#  base loyalty program.
#  If the purchase also qualifies for a `POINTS_MULTIPLIER` promotion incentive
#  with a `points_multiplier`
#  of 3, the buyer earns a total of 15 points (5 program points x 3 promotion
#  multiplier = 15 points).
#  DEPRECATED at version 2023-08-16. Replaced by the `multiplier` field.
#  One of the following is required when specifying a points multiplier:
#  - (Recommended) The `multiplier` field.
#  - This deprecated `points_multiplier` field. If provided in the request, Square
#  also returns `multiplier`
#  with the equivalent value.
    attr_reader :points_multiplier
  # @return [String] The multiplier used to calculate the number of points earned each time the
#  promotion is triggered,
#  specified as a string representation of a decimal. Square supports multipliers
#  up to 10x, with three
#  point precision for decimal multipliers. For example, suppose a purchase
#  qualifies for 4 points from the
#  base loyalty program. If the purchase also qualifies for a `POINTS_MULTIPLIER`
#  promotion incentive with a
#  `multiplier` of "1.5", the buyer earns a total of 6 points (4 program points x
#  1.5 promotion multiplier = 6 points).
#  Fractional points are dropped.
#  One of the following is required when specifying a points multiplier:
#  - (Recommended) This `multiplier` field.
#  - The deprecated `points_multiplier` field. If provided in the request, Square
#  also returns `multiplier`
#  with the equivalent value.
    attr_reader :multiplier
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param points_multiplier [Integer] The multiplier used to calculate the number of points earned each time the
#  promotion
#  is triggered. For example, suppose a purchase qualifies for 5 points from the
#  base loyalty program.
#  If the purchase also qualifies for a `POINTS_MULTIPLIER` promotion incentive
#  with a `points_multiplier`
#  of 3, the buyer earns a total of 15 points (5 program points x 3 promotion
#  multiplier = 15 points).
#  DEPRECATED at version 2023-08-16. Replaced by the `multiplier` field.
#  One of the following is required when specifying a points multiplier:
#  - (Recommended) The `multiplier` field.
#  - This deprecated `points_multiplier` field. If provided in the request, Square
#  also returns `multiplier`
#  with the equivalent value.
    # @param multiplier [String] The multiplier used to calculate the number of points earned each time the
#  promotion is triggered,
#  specified as a string representation of a decimal. Square supports multipliers
#  up to 10x, with three
#  point precision for decimal multipliers. For example, suppose a purchase
#  qualifies for 4 points from the
#  base loyalty program. If the purchase also qualifies for a `POINTS_MULTIPLIER`
#  promotion incentive with a
#  `multiplier` of "1.5", the buyer earns a total of 6 points (4 program points x
#  1.5 promotion multiplier = 6 points).
#  Fractional points are dropped.
#  One of the following is required when specifying a points multiplier:
#  - (Recommended) This `multiplier` field.
#  - The deprecated `points_multiplier` field. If provided in the request, Square
#  also returns `multiplier`
#  with the equivalent value.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyPromotionIncentivePointsMultiplierData]
    def initialize(points_multiplier: OMIT, multiplier: OMIT, additional_properties: nil)
      @points_multiplier = points_multiplier if points_multiplier != OMIT
      @multiplier = multiplier if multiplier != OMIT
      @additional_properties = additional_properties
      @_field_set = { "points_multiplier": points_multiplier, "multiplier": multiplier }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  LoyaltyPromotionIncentivePointsMultiplierData
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyPromotionIncentivePointsMultiplierData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      points_multiplier = parsed_json["points_multiplier"]
      multiplier = parsed_json["multiplier"]
      new(
        points_multiplier: points_multiplier,
        multiplier: multiplier,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyPromotionIncentivePointsMultiplierData to a JSON
#  object
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
      obj.points_multiplier&.is_a?(Integer) != false || raise("Passed value for field obj.points_multiplier is not the expected type, validation failed.")
      obj.multiplier&.is_a?(String) != false || raise("Passed value for field obj.multiplier is not the expected type, validation failed.")
    end
  end
end