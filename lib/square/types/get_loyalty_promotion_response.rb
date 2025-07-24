# frozen_string_literal: true
require_relative "error"
require_relative "loyalty_promotion"
require "ostruct"
require "json"

module square.rb
# Represents a
#  trieveLoyaltyPromotionPromotions](api-endpoint:Loyalty-RetrieveLoyaltyPromotion)
#  response.
  class GetLoyaltyPromotionResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::LoyaltyPromotion] The retrieved loyalty promotion.
    attr_reader :loyalty_promotion
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param loyalty_promotion [square.rb::LoyaltyPromotion] The retrieved loyalty promotion.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetLoyaltyPromotionResponse]
    def initialize(errors: OMIT, loyalty_promotion: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @loyalty_promotion = loyalty_promotion if loyalty_promotion != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "loyalty_promotion": loyalty_promotion }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetLoyaltyPromotionResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetLoyaltyPromotionResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["loyalty_promotion"].nil?
        loyalty_promotion = parsed_json["loyalty_promotion"].to_json
        loyalty_promotion = square.rb::LoyaltyPromotion.from_json(json_object: loyalty_promotion)
      else
        loyalty_promotion = nil
      end
      new(
        errors: errors,
        loyalty_promotion: loyalty_promotion,
        additional_properties: struct
      )
    end
# Serialize an instance of GetLoyaltyPromotionResponse to a JSON object
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
      obj.loyalty_promotion.nil? || square.rb::LoyaltyPromotion.validate_raw(obj: obj.loyalty_promotion)
    end
  end
end