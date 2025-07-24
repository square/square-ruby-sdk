# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents the metadata for a `POINTS_ADDITION` type of [loyalty promotion
#  incentive](entity:LoyaltyPromotionIncentive).
  class LoyaltyPromotionIncentivePointsAdditionData
  # @return [Integer] The number of additional points to earn each time the promotion is triggered.
#  For example,
#  suppose a purchase qualifies for 5 points from the base loyalty program. If the
#  purchase also
#  qualifies for a `POINTS_ADDITION` promotion incentive with a `points_addition`
#  of 3, the buyer
#  earns a total of 8 points (5 program points + 3 promotion points = 8 points).
    attr_reader :points_addition
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param points_addition [Integer] The number of additional points to earn each time the promotion is triggered.
#  For example,
#  suppose a purchase qualifies for 5 points from the base loyalty program. If the
#  purchase also
#  qualifies for a `POINTS_ADDITION` promotion incentive with a `points_addition`
#  of 3, the buyer
#  earns a total of 8 points (5 program points + 3 promotion points = 8 points).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyPromotionIncentivePointsAdditionData]
    def initialize(points_addition:, additional_properties: nil)
      @points_addition = points_addition
      @additional_properties = additional_properties
      @_field_set = { "points_addition": points_addition }
    end
# Deserialize a JSON object to an instance of
#  LoyaltyPromotionIncentivePointsAdditionData
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyPromotionIncentivePointsAdditionData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      points_addition = parsed_json["points_addition"]
      new(points_addition: points_addition, additional_properties: struct)
    end
# Serialize an instance of LoyaltyPromotionIncentivePointsAdditionData to a JSON
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
      obj.points_addition.is_a?(Integer) != false || raise("Passed value for field obj.points_addition is not the expected type, validation failed.")
    end
  end
end