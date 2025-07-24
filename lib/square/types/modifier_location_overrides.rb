# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# Location-specific overrides for specified properties of a `CatalogModifier`
#  object.
  class ModifierLocationOverrides
  # @return [String] The ID of the `Location` object representing the location. This can include a
#  deactivated location.
    attr_reader :location_id
  # @return [square.rb::Money] The overridden price at the specified location. If this is unspecified, the
#  modifier price is not overridden.
#  The modifier becomes free of charge at the specified location, when this
#  `price_money` field is set to 0.
    attr_reader :price_money
  # @return [Boolean] Indicates whether the modifier is sold out at the specified location or not. As
#  an example, for cheese (modifier) burger (item), when the modifier is sold out,
#  it is the cheese, but not the burger, that is sold out.
#  The seller can manually set this sold out status. Attempts by an application to
#  set this attribute are ignored.
    attr_reader :sold_out
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_id [String] The ID of the `Location` object representing the location. This can include a
#  deactivated location.
    # @param price_money [square.rb::Money] The overridden price at the specified location. If this is unspecified, the
#  modifier price is not overridden.
#  The modifier becomes free of charge at the specified location, when this
#  `price_money` field is set to 0.
    # @param sold_out [Boolean] Indicates whether the modifier is sold out at the specified location or not. As
#  an example, for cheese (modifier) burger (item), when the modifier is sold out,
#  it is the cheese, but not the burger, that is sold out.
#  The seller can manually set this sold out status. Attempts by an application to
#  set this attribute are ignored.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ModifierLocationOverrides]
    def initialize(location_id: OMIT, price_money: OMIT, sold_out: OMIT, additional_properties: nil)
      @location_id = location_id if location_id != OMIT
      @price_money = price_money if price_money != OMIT
      @sold_out = sold_out if sold_out != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_id": location_id, "price_money": price_money, "sold_out": sold_out }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ModifierLocationOverrides
    #
    # @param json_object [String] 
    # @return [square.rb::ModifierLocationOverrides]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_id = parsed_json["location_id"]
      unless parsed_json["price_money"].nil?
        price_money = parsed_json["price_money"].to_json
        price_money = square.rb::Money.from_json(json_object: price_money)
      else
        price_money = nil
      end
      sold_out = parsed_json["sold_out"]
      new(
        location_id: location_id,
        price_money: price_money,
        sold_out: sold_out,
        additional_properties: struct
      )
    end
# Serialize an instance of ModifierLocationOverrides to a JSON object
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
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.price_money.nil? || square.rb::Money.validate_raw(obj: obj.price_money)
      obj.sold_out&.is_a?(Boolean) != false || raise("Passed value for field obj.sold_out is not the expected type, validation failed.")
    end
  end
end