# frozen_string_literal: true
require_relative "loyalty_promotion"
require "ostruct"
require "json"

module square.rb
# An object that contains the loyalty promotion associated with a
#  `loyalty.promotion.updated` event.
  class LoyaltyPromotionUpdatedEventObject
  # @return [square.rb::LoyaltyPromotion] The loyalty promotion that was updated.
    attr_reader :loyalty_promotion
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param loyalty_promotion [square.rb::LoyaltyPromotion] The loyalty promotion that was updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyPromotionUpdatedEventObject]
    def initialize(loyalty_promotion: OMIT, additional_properties: nil)
      @loyalty_promotion = loyalty_promotion if loyalty_promotion != OMIT
      @additional_properties = additional_properties
      @_field_set = { "loyalty_promotion": loyalty_promotion }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyPromotionUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyPromotionUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["loyalty_promotion"].nil?
        loyalty_promotion = parsed_json["loyalty_promotion"].to_json
        loyalty_promotion = square.rb::LoyaltyPromotion.from_json(json_object: loyalty_promotion)
      else
        loyalty_promotion = nil
      end
      new(loyalty_promotion: loyalty_promotion, additional_properties: struct)
    end
# Serialize an instance of LoyaltyPromotionUpdatedEventObject to a JSON object
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
      obj.loyalty_promotion.nil? || square.rb::LoyaltyPromotion.validate_raw(obj: obj.loyalty_promotion)
    end
  end
end