# frozen_string_literal: true
require_relative "subscription_pricing_type"
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# Describes the pricing for the subscription.
  class SubscriptionPricing
  # @return [SquareApiClient::SubscriptionPricingType] RELATIVE or STATIC
#  See [SubscriptionPricingType](#type-subscriptionpricingtype) for possible values
    attr_reader :type
  # @return [Array<String>] The ids of the discount catalog objects
    attr_reader :discount_ids
  # @return [SquareApiClient::Money] The price of the subscription, if STATIC
    attr_reader :price_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [SquareApiClient::SubscriptionPricingType] RELATIVE or STATIC
#  See [SubscriptionPricingType](#type-subscriptionpricingtype) for possible values
    # @param discount_ids [Array<String>] The ids of the discount catalog objects
    # @param price_money [SquareApiClient::Money] The price of the subscription, if STATIC
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SubscriptionPricing]
    def initialize(type: OMIT, discount_ids: OMIT, price_money: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @discount_ids = discount_ids if discount_ids != OMIT
      @price_money = price_money if price_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "discount_ids": discount_ids, "price_money": price_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SubscriptionPricing
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SubscriptionPricing]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      discount_ids = parsed_json["discount_ids"]
      unless parsed_json["price_money"].nil?
        price_money = parsed_json["price_money"].to_json
        price_money = SquareApiClient::Money.from_json(json_object: price_money)
      else
        price_money = nil
      end
      new(
        type: type,
        discount_ids: discount_ids,
        price_money: price_money,
        additional_properties: struct
      )
    end
# Serialize an instance of SubscriptionPricing to a JSON object
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
      obj.type&.is_a?(SquareApiClient::SubscriptionPricingType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.discount_ids&.is_a?(Array) != false || raise("Passed value for field obj.discount_ids is not the expected type, validation failed.")
      obj.price_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.price_money)
    end
  end
end