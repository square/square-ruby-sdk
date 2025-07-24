# frozen_string_literal: true
require_relative "order"
require_relative "catalog_object"
require "ostruct"
require "json"

module square.rb
  class PaymentLinkRelatedResources
  # @return [Array<square.rb::Order>] The order associated with the payment link.
    attr_reader :orders
  # @return [Array<square.rb::CatalogObject>] The subscription plan associated with the payment link.
    attr_reader :subscription_plans
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param orders [Array<square.rb::Order>] The order associated with the payment link.
    # @param subscription_plans [Array<square.rb::CatalogObject>] The subscription plan associated with the payment link.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::PaymentLinkRelatedResources]
    def initialize(orders: OMIT, subscription_plans: OMIT, additional_properties: nil)
      @orders = orders if orders != OMIT
      @subscription_plans = subscription_plans if subscription_plans != OMIT
      @additional_properties = additional_properties
      @_field_set = { "orders": orders, "subscription_plans": subscription_plans }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentLinkRelatedResources
    #
    # @param json_object [String] 
    # @return [square.rb::PaymentLinkRelatedResources]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      orders = parsed_json["orders"]&.map do | item |
  item = item.to_json
  square.rb::Order.from_json(json_object: item)
end
      subscription_plans = parsed_json["subscription_plans"]&.map do | item |
  item = item.to_json
  square.rb::CatalogObject.from_json(json_object: item)
end
      new(
        orders: orders,
        subscription_plans: subscription_plans,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentLinkRelatedResources to a JSON object
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
      obj.orders&.is_a?(Array) != false || raise("Passed value for field obj.orders is not the expected type, validation failed.")
      obj.subscription_plans&.is_a?(Array) != false || raise("Passed value for field obj.subscription_plans is not the expected type, validation failed.")
    end
  end
end