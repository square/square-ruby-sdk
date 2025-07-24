# frozen_string_literal: true
require_relative "money"
require_relative "catalog_pricing_type"
require_relative "inventory_alert_type"
require "ostruct"
require "json"

module SquareApiClient
# Price and inventory alerting overrides for a `CatalogItemVariation` at a
#  specific `Location`.
  class ItemVariationLocationOverrides
  # @return [String] The ID of the `Location`. This can include locations that are deactivated.
    attr_reader :location_id
  # @return [SquareApiClient::Money] The price of the `CatalogItemVariation` at the given `Location`, or blank for
#  variable pricing.
    attr_reader :price_money
  # @return [SquareApiClient::CatalogPricingType] The pricing type (fixed or variable) for the `CatalogItemVariation` at the given
#  `Location`.
#  See [CatalogPricingType](#type-catalogpricingtype) for possible values
    attr_reader :pricing_type
  # @return [Boolean] If `true`, inventory tracking is active for the `CatalogItemVariation` at this
#  `Location`.
    attr_reader :track_inventory
  # @return [SquareApiClient::InventoryAlertType] Indicates whether the `CatalogItemVariation` displays an alert when its
#  inventory
#  quantity is less than or equal to its `inventory_alert_threshold`.
#  See [InventoryAlertType](#type-inventoryalerttype) for possible values
    attr_reader :inventory_alert_type
  # @return [Long] If the inventory quantity for the variation is less than or equal to this value
#  and `inventory_alert_type`
#  is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.
#  This value is always an integer.
    attr_reader :inventory_alert_threshold
  # @return [Boolean] Indicates whether the overridden item variation is sold out at the specified
#  location.
#  When inventory tracking is enabled on the item variation either globally or at
#  the specified location,
#  the item variation is automatically marked as sold out when its inventory count
#  reaches zero. The seller
#  can manually set the item variation as sold out even when the inventory count is
#  greater than zero.
#  Attempts by an application to set this attribute are ignored. Regardless how the
#  sold-out status is set,
#  applications should treat its inventory count as zero when this attribute value
#  is `true`.
    attr_reader :sold_out
  # @return [String] The seller-assigned timestamp, of the RFC 3339 format, to indicate when this
#  sold-out variation
#  becomes available again at the specified location. Attempts by an application to
#  set this attribute are ignored.
#  When the current time is later than this attribute value, the affected item
#  variation is no longer sold out.
    attr_reader :sold_out_valid_until
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param location_id [String] The ID of the `Location`. This can include locations that are deactivated.
    # @param price_money [SquareApiClient::Money] The price of the `CatalogItemVariation` at the given `Location`, or blank for
#  variable pricing.
    # @param pricing_type [SquareApiClient::CatalogPricingType] The pricing type (fixed or variable) for the `CatalogItemVariation` at the given
#  `Location`.
#  See [CatalogPricingType](#type-catalogpricingtype) for possible values
    # @param track_inventory [Boolean] If `true`, inventory tracking is active for the `CatalogItemVariation` at this
#  `Location`.
    # @param inventory_alert_type [SquareApiClient::InventoryAlertType] Indicates whether the `CatalogItemVariation` displays an alert when its
#  inventory
#  quantity is less than or equal to its `inventory_alert_threshold`.
#  See [InventoryAlertType](#type-inventoryalerttype) for possible values
    # @param inventory_alert_threshold [Long] If the inventory quantity for the variation is less than or equal to this value
#  and `inventory_alert_type`
#  is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.
#  This value is always an integer.
    # @param sold_out [Boolean] Indicates whether the overridden item variation is sold out at the specified
#  location.
#  When inventory tracking is enabled on the item variation either globally or at
#  the specified location,
#  the item variation is automatically marked as sold out when its inventory count
#  reaches zero. The seller
#  can manually set the item variation as sold out even when the inventory count is
#  greater than zero.
#  Attempts by an application to set this attribute are ignored. Regardless how the
#  sold-out status is set,
#  applications should treat its inventory count as zero when this attribute value
#  is `true`.
    # @param sold_out_valid_until [String] The seller-assigned timestamp, of the RFC 3339 format, to indicate when this
#  sold-out variation
#  becomes available again at the specified location. Attempts by an application to
#  set this attribute are ignored.
#  When the current time is later than this attribute value, the affected item
#  variation is no longer sold out.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ItemVariationLocationOverrides]
    def initialize(location_id: OMIT, price_money: OMIT, pricing_type: OMIT, track_inventory: OMIT, inventory_alert_type: OMIT, inventory_alert_threshold: OMIT, sold_out: OMIT, sold_out_valid_until: OMIT, additional_properties: nil)
      @location_id = location_id if location_id != OMIT
      @price_money = price_money if price_money != OMIT
      @pricing_type = pricing_type if pricing_type != OMIT
      @track_inventory = track_inventory if track_inventory != OMIT
      @inventory_alert_type = inventory_alert_type if inventory_alert_type != OMIT
      @inventory_alert_threshold = inventory_alert_threshold if inventory_alert_threshold != OMIT
      @sold_out = sold_out if sold_out != OMIT
      @sold_out_valid_until = sold_out_valid_until if sold_out_valid_until != OMIT
      @additional_properties = additional_properties
      @_field_set = { "location_id": location_id, "price_money": price_money, "pricing_type": pricing_type, "track_inventory": track_inventory, "inventory_alert_type": inventory_alert_type, "inventory_alert_threshold": inventory_alert_threshold, "sold_out": sold_out, "sold_out_valid_until": sold_out_valid_until }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ItemVariationLocationOverrides
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ItemVariationLocationOverrides]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      location_id = parsed_json["location_id"]
      unless parsed_json["price_money"].nil?
        price_money = parsed_json["price_money"].to_json
        price_money = SquareApiClient::Money.from_json(json_object: price_money)
      else
        price_money = nil
      end
      pricing_type = parsed_json["pricing_type"]
      track_inventory = parsed_json["track_inventory"]
      inventory_alert_type = parsed_json["inventory_alert_type"]
      inventory_alert_threshold = parsed_json["inventory_alert_threshold"]
      sold_out = parsed_json["sold_out"]
      sold_out_valid_until = parsed_json["sold_out_valid_until"]
      new(
        location_id: location_id,
        price_money: price_money,
        pricing_type: pricing_type,
        track_inventory: track_inventory,
        inventory_alert_type: inventory_alert_type,
        inventory_alert_threshold: inventory_alert_threshold,
        sold_out: sold_out,
        sold_out_valid_until: sold_out_valid_until,
        additional_properties: struct
      )
    end
# Serialize an instance of ItemVariationLocationOverrides to a JSON object
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
      obj.price_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.price_money)
      obj.pricing_type&.is_a?(SquareApiClient::CatalogPricingType) != false || raise("Passed value for field obj.pricing_type is not the expected type, validation failed.")
      obj.track_inventory&.is_a?(Boolean) != false || raise("Passed value for field obj.track_inventory is not the expected type, validation failed.")
      obj.inventory_alert_type&.is_a?(SquareApiClient::InventoryAlertType) != false || raise("Passed value for field obj.inventory_alert_type is not the expected type, validation failed.")
      obj.inventory_alert_threshold&.is_a?(Long) != false || raise("Passed value for field obj.inventory_alert_threshold is not the expected type, validation failed.")
      obj.sold_out&.is_a?(Boolean) != false || raise("Passed value for field obj.sold_out is not the expected type, validation failed.")
      obj.sold_out_valid_until&.is_a?(String) != false || raise("Passed value for field obj.sold_out_valid_until is not the expected type, validation failed.")
    end
  end
end