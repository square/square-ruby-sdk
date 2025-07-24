# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# Describes an ad hoc item and price to generate a quick pay checkout link.
#  For more information,
#  see [Quick Pay
#  Checkout](https://developer.squareup.com/docs/checkout-api/quick-pay-checkout).
  class QuickPay
  # @return [String] The ad hoc item name. In the resulting `Order`, this name appears as the line
#  item name.
    attr_reader :name
  # @return [SquareApiClient::Money] The price of the item.
    attr_reader :price_money
  # @return [String] The ID of the business location the checkout is associated with.
    attr_reader :location_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The ad hoc item name. In the resulting `Order`, this name appears as the line
#  item name.
    # @param price_money [SquareApiClient::Money] The price of the item.
    # @param location_id [String] The ID of the business location the checkout is associated with.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::QuickPay]
    def initialize(name:, price_money:, location_id:, additional_properties: nil)
      @name = name
      @price_money = price_money
      @location_id = location_id
      @additional_properties = additional_properties
      @_field_set = { "name": name, "price_money": price_money, "location_id": location_id }
    end
# Deserialize a JSON object to an instance of QuickPay
    #
    # @param json_object [String] 
    # @return [SquareApiClient::QuickPay]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      unless parsed_json["price_money"].nil?
        price_money = parsed_json["price_money"].to_json
        price_money = SquareApiClient::Money.from_json(json_object: price_money)
      else
        price_money = nil
      end
      location_id = parsed_json["location_id"]
      new(
        name: name,
        price_money: price_money,
        location_id: location_id,
        additional_properties: struct
      )
    end
# Serialize an instance of QuickPay to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      SquareApiClient::Money.validate_raw(obj: obj.price_money)
      obj.location_id.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
    end
  end
end