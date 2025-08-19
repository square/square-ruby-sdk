# frozen_string_literal: true
require_relative "inventory_state"
require "ostruct"
require "json"

module SquareApiClient
# Represents Square-estimated quantity of items in a particular state at a
#  particular seller location based on the known history of physical counts and
#  inventory adjustments.
  class InventoryCount
  # @return [String] The Square-generated ID of the
#  [CatalogObject](entity:CatalogObject) being tracked.
    attr_reader :catalog_object_id
  # @return [String] The [type](entity:CatalogObjectType) of the
#  [CatalogObject](entity:CatalogObject) being tracked.
#  The Inventory API supports setting and reading the `"catalog_object_type":
#  "ITEM_VARIATION"` field value.
#  In addition, it can also read the `"catalog_object_type": "ITEM"` field value
#  that is set by the Square Restaurants app.
    attr_reader :catalog_object_type
  # @return [SquareApiClient::InventoryState] The current [inventory state](entity:InventoryState) for the related
#  quantity of items.
#  See [InventoryState](#type-inventorystate) for possible values
    attr_reader :state
  # @return [String] The Square-generated ID of the [Location](entity:Location) where the related
#  quantity of items is being tracked.
    attr_reader :location_id
  # @return [String] The number of items affected by the estimated count as a decimal string.
#  Can support up to 5 digits after the decimal point.
    attr_reader :quantity
  # @return [String] An RFC 3339-formatted timestamp that indicates when the most recent physical
#  count or adjustment affecting
#  the estimated count is received.
    attr_reader :calculated_at
  # @return [Boolean] Whether the inventory count is for composed variation (TRUE) or not (FALSE). If
#  true, the inventory count will not be present in the response of
#  any of these endpoints:
#  [BatchChangeInventory](api-endpoint:Inventory-BatchChangeInventory),
#  RetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges),
#  chRetrieveInventoryCounts](api-endpoint:Inventory-BatchRetrieveInventoryCounts),
#  and
#  [RetrieveInventoryChanges](api-endpoint:Inventory-RetrieveInventoryChanges).
    attr_reader :is_estimated
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param catalog_object_id [String] The Square-generated ID of the
#  [CatalogObject](entity:CatalogObject) being tracked.
    # @param catalog_object_type [String] The [type](entity:CatalogObjectType) of the
#  [CatalogObject](entity:CatalogObject) being tracked.
#  The Inventory API supports setting and reading the `"catalog_object_type":
#  "ITEM_VARIATION"` field value.
#  In addition, it can also read the `"catalog_object_type": "ITEM"` field value
#  that is set by the Square Restaurants app.
    # @param state [SquareApiClient::InventoryState] The current [inventory state](entity:InventoryState) for the related
#  quantity of items.
#  See [InventoryState](#type-inventorystate) for possible values
    # @param location_id [String] The Square-generated ID of the [Location](entity:Location) where the related
#  quantity of items is being tracked.
    # @param quantity [String] The number of items affected by the estimated count as a decimal string.
#  Can support up to 5 digits after the decimal point.
    # @param calculated_at [String] An RFC 3339-formatted timestamp that indicates when the most recent physical
#  count or adjustment affecting
#  the estimated count is received.
    # @param is_estimated [Boolean] Whether the inventory count is for composed variation (TRUE) or not (FALSE). If
#  true, the inventory count will not be present in the response of
#  any of these endpoints:
#  [BatchChangeInventory](api-endpoint:Inventory-BatchChangeInventory),
#  RetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges),
#  chRetrieveInventoryCounts](api-endpoint:Inventory-BatchRetrieveInventoryCounts),
#  and
#  [RetrieveInventoryChanges](api-endpoint:Inventory-RetrieveInventoryChanges).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::InventoryCount]
    def initialize(catalog_object_id: OMIT, catalog_object_type: OMIT, state: OMIT, location_id: OMIT, quantity: OMIT, calculated_at: OMIT, is_estimated: OMIT, additional_properties: nil)
      @catalog_object_id = catalog_object_id if catalog_object_id != OMIT
      @catalog_object_type = catalog_object_type if catalog_object_type != OMIT
      @state = state if state != OMIT
      @location_id = location_id if location_id != OMIT
      @quantity = quantity if quantity != OMIT
      @calculated_at = calculated_at if calculated_at != OMIT
      @is_estimated = is_estimated if is_estimated != OMIT
      @additional_properties = additional_properties
      @_field_set = { "catalog_object_id": catalog_object_id, "catalog_object_type": catalog_object_type, "state": state, "location_id": location_id, "quantity": quantity, "calculated_at": calculated_at, "is_estimated": is_estimated }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InventoryCount
    #
    # @param json_object [String] 
    # @return [SquareApiClient::InventoryCount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      catalog_object_id = parsed_json["catalog_object_id"]
      catalog_object_type = parsed_json["catalog_object_type"]
      state = parsed_json["state"]
      location_id = parsed_json["location_id"]
      quantity = parsed_json["quantity"]
      calculated_at = parsed_json["calculated_at"]
      is_estimated = parsed_json["is_estimated"]
      new(
        catalog_object_id: catalog_object_id,
        catalog_object_type: catalog_object_type,
        state: state,
        location_id: location_id,
        quantity: quantity,
        calculated_at: calculated_at,
        is_estimated: is_estimated,
        additional_properties: struct
      )
    end
# Serialize an instance of InventoryCount to a JSON object
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
      obj.catalog_object_id&.is_a?(String) != false || raise("Passed value for field obj.catalog_object_id is not the expected type, validation failed.")
      obj.catalog_object_type&.is_a?(String) != false || raise("Passed value for field obj.catalog_object_type is not the expected type, validation failed.")
      obj.state&.is_a?(SquareApiClient::InventoryState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.quantity&.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
      obj.calculated_at&.is_a?(String) != false || raise("Passed value for field obj.calculated_at is not the expected type, validation failed.")
      obj.is_estimated&.is_a?(Boolean) != false || raise("Passed value for field obj.is_estimated is not the expected type, validation failed.")
    end
  end
end