# frozen_string_literal: true
require_relative "error"
require_relative "loyalty_promotion"
require "ostruct"
require "json"

module square.rb
# Represents a [ListLoyaltyPromotions](api-endpoint:Loyalty-ListLoyaltyPromotions)
#  response.
#  One of `loyalty_promotions`, an empty object, or `errors` is present in the
#  response.
#  If additional results are available, the `cursor` field is also present along
#  with `loyalty_promotions`.
  class ListLoyaltyPromotionsResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<square.rb::LoyaltyPromotion>] The retrieved loyalty promotions.
    attr_reader :loyalty_promotions
  # @return [String] The cursor to use in your next call to this endpoint to retrieve the next page
#  of results
#  for your original request. This field is present only if the request succeeded
#  and additional
#  results are available. For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param loyalty_promotions [Array<square.rb::LoyaltyPromotion>] The retrieved loyalty promotions.
    # @param cursor [String] The cursor to use in your next call to this endpoint to retrieve the next page
#  of results
#  for your original request. This field is present only if the request succeeded
#  and additional
#  results are available. For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ListLoyaltyPromotionsResponse]
    def initialize(errors: OMIT, loyalty_promotions: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @loyalty_promotions = loyalty_promotions if loyalty_promotions != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "loyalty_promotions": loyalty_promotions, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListLoyaltyPromotionsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::ListLoyaltyPromotionsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      loyalty_promotions = parsed_json["loyalty_promotions"]&.map do | item |
  item = item.to_json
  square.rb::LoyaltyPromotion.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        loyalty_promotions: loyalty_promotions,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListLoyaltyPromotionsResponse to a JSON object
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
      obj.loyalty_promotions&.is_a?(Array) != false || raise("Passed value for field obj.loyalty_promotions is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end