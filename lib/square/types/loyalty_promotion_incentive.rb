# frozen_string_literal: true
require_relative "loyalty_promotion_incentive_type"
require_relative "loyalty_promotion_incentive_points_multiplier_data"
require_relative "loyalty_promotion_incentive_points_addition_data"
require "ostruct"
require "json"

module square.rb
# Represents how points for a [loyalty promotion](entity:LoyaltyPromotion) are
#  calculated,
#  either by multiplying the points earned from the base program or by adding a
#  specified number
#  of points to the points earned from the base program.
  class LoyaltyPromotionIncentive
  # @return [square.rb::LoyaltyPromotionIncentiveType] The type of points incentive.
#  See [LoyaltyPromotionIncentiveType](#type-loyaltypromotionincentivetype) for
#  possible values
    attr_reader :type
  # @return [square.rb::LoyaltyPromotionIncentivePointsMultiplierData] Additional data for a `POINTS_MULTIPLIER` incentive type.
    attr_reader :points_multiplier_data
  # @return [square.rb::LoyaltyPromotionIncentivePointsAdditionData] Additional data for a `POINTS_ADDITION` incentive type.
    attr_reader :points_addition_data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [square.rb::LoyaltyPromotionIncentiveType] The type of points incentive.
#  See [LoyaltyPromotionIncentiveType](#type-loyaltypromotionincentivetype) for
#  possible values
    # @param points_multiplier_data [square.rb::LoyaltyPromotionIncentivePointsMultiplierData] Additional data for a `POINTS_MULTIPLIER` incentive type.
    # @param points_addition_data [square.rb::LoyaltyPromotionIncentivePointsAdditionData] Additional data for a `POINTS_ADDITION` incentive type.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyPromotionIncentive]
    def initialize(type:, points_multiplier_data: OMIT, points_addition_data: OMIT, additional_properties: nil)
      @type = type
      @points_multiplier_data = points_multiplier_data if points_multiplier_data != OMIT
      @points_addition_data = points_addition_data if points_addition_data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "points_multiplier_data": points_multiplier_data, "points_addition_data": points_addition_data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyPromotionIncentive
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyPromotionIncentive]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      unless parsed_json["points_multiplier_data"].nil?
        points_multiplier_data = parsed_json["points_multiplier_data"].to_json
        points_multiplier_data = square.rb::LoyaltyPromotionIncentivePointsMultiplierData.from_json(json_object: points_multiplier_data)
      else
        points_multiplier_data = nil
      end
      unless parsed_json["points_addition_data"].nil?
        points_addition_data = parsed_json["points_addition_data"].to_json
        points_addition_data = square.rb::LoyaltyPromotionIncentivePointsAdditionData.from_json(json_object: points_addition_data)
      else
        points_addition_data = nil
      end
      new(
        type: type,
        points_multiplier_data: points_multiplier_data,
        points_addition_data: points_addition_data,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyPromotionIncentive to a JSON object
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
      obj.type.is_a?(square.rb::LoyaltyPromotionIncentiveType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.points_multiplier_data.nil? || square.rb::LoyaltyPromotionIncentivePointsMultiplierData.validate_raw(obj: obj.points_multiplier_data)
      obj.points_addition_data.nil? || square.rb::LoyaltyPromotionIncentivePointsAdditionData.validate_raw(obj: obj.points_addition_data)
    end
  end
end