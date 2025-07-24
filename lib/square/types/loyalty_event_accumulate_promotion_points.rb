# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Provides metadata when the event `type` is `ACCUMULATE_PROMOTION_POINTS`.
  class LoyaltyEventAccumulatePromotionPoints
  # @return [String] The Square-assigned ID of the [loyalty program](entity:LoyaltyProgram).
    attr_reader :loyalty_program_id
  # @return [String] The Square-assigned ID of the [loyalty promotion](entity:LoyaltyPromotion).
    attr_reader :loyalty_promotion_id
  # @return [Integer] The number of points earned by the event.
    attr_reader :points
  # @return [String] The ID of the [order](entity:Order) for which the buyer earned the promotion
#  points.
#  Only applications that use the Orders API to process orders can trigger this
#  event.
    attr_reader :order_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param loyalty_program_id [String] The Square-assigned ID of the [loyalty program](entity:LoyaltyProgram).
    # @param loyalty_promotion_id [String] The Square-assigned ID of the [loyalty promotion](entity:LoyaltyPromotion).
    # @param points [Integer] The number of points earned by the event.
    # @param order_id [String] The ID of the [order](entity:Order) for which the buyer earned the promotion
#  points.
#  Only applications that use the Orders API to process orders can trigger this
#  event.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyEventAccumulatePromotionPoints]
    def initialize(loyalty_program_id: OMIT, loyalty_promotion_id: OMIT, points: OMIT, order_id: OMIT, additional_properties: nil)
      @loyalty_program_id = loyalty_program_id if loyalty_program_id != OMIT
      @loyalty_promotion_id = loyalty_promotion_id if loyalty_promotion_id != OMIT
      @points = points if points != OMIT
      @order_id = order_id if order_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "loyalty_program_id": loyalty_program_id, "loyalty_promotion_id": loyalty_promotion_id, "points": points, "order_id": order_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  LoyaltyEventAccumulatePromotionPoints
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyEventAccumulatePromotionPoints]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      loyalty_program_id = parsed_json["loyalty_program_id"]
      loyalty_promotion_id = parsed_json["loyalty_promotion_id"]
      points = parsed_json["points"]
      order_id = parsed_json["order_id"]
      new(
        loyalty_program_id: loyalty_program_id,
        loyalty_promotion_id: loyalty_promotion_id,
        points: points,
        order_id: order_id,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyEventAccumulatePromotionPoints to a JSON object
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
      obj.loyalty_promotion_id&.is_a?(String) != false || raise("Passed value for field obj.loyalty_promotion_id is not the expected type, validation failed.")
      obj.points&.is_a?(Integer) != false || raise("Passed value for field obj.points is not the expected type, validation failed.")
      obj.order_id&.is_a?(String) != false || raise("Passed value for field obj.order_id is not the expected type, validation failed.")
    end
  end
end