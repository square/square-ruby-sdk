# frozen_string_literal: true
require_relative "inventory_change_type"
require_relative "inventory_physical_count"
require_relative "inventory_adjustment"
require_relative "inventory_transfer"
require_relative "catalog_measurement_unit"
require "ostruct"
require "json"

module SquareApiClient
# Represents a single physical count, inventory, adjustment, or transfer
#  that is part of the history of inventory changes for a particular
#  [CatalogObject](entity:CatalogObject) instance.
  class InventoryChange
  # @return [SquareApiClient::InventoryChangeType] Indicates how the inventory change is applied. See
#  [InventoryChangeType](entity:InventoryChangeType) for all possible values.
#  See [InventoryChangeType](#type-inventorychangetype) for possible values
    attr_reader :type
  # @return [SquareApiClient::InventoryPhysicalCount] Contains details about the physical count when `type` is
#  `PHYSICAL_COUNT`, and is unset for all other change types.
    attr_reader :physical_count
  # @return [SquareApiClient::InventoryAdjustment] Contains details about the inventory adjustment when `type` is
#  `ADJUSTMENT`, and is unset for all other change types.
    attr_reader :adjustment
  # @return [SquareApiClient::InventoryTransfer] Contains details about the inventory transfer when `type` is
#  `TRANSFER`, and is unset for all other change types.
#  _Note:_ An [InventoryTransfer](entity:InventoryTransfer) object can only be set
#  in the input to the
#  [BatchChangeInventory](api-endpoint:Inventory-BatchChangeInventory) endpoint
#  when the seller has an active Retail Plus subscription.
    attr_reader :transfer
  # @return [SquareApiClient::CatalogMeasurementUnit] The [CatalogMeasurementUnit](entity:CatalogMeasurementUnit) object representing
#  the catalog measurement unit associated with the inventory change.
    attr_reader :measurement_unit
  # @return [String] The ID of the [CatalogMeasurementUnit](entity:CatalogMeasurementUnit) object
#  representing the catalog measurement unit associated with the inventory change.
    attr_reader :measurement_unit_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [SquareApiClient::InventoryChangeType] Indicates how the inventory change is applied. See
#  [InventoryChangeType](entity:InventoryChangeType) for all possible values.
#  See [InventoryChangeType](#type-inventorychangetype) for possible values
    # @param physical_count [SquareApiClient::InventoryPhysicalCount] Contains details about the physical count when `type` is
#  `PHYSICAL_COUNT`, and is unset for all other change types.
    # @param adjustment [SquareApiClient::InventoryAdjustment] Contains details about the inventory adjustment when `type` is
#  `ADJUSTMENT`, and is unset for all other change types.
    # @param transfer [SquareApiClient::InventoryTransfer] Contains details about the inventory transfer when `type` is
#  `TRANSFER`, and is unset for all other change types.
#  _Note:_ An [InventoryTransfer](entity:InventoryTransfer) object can only be set
#  in the input to the
#  [BatchChangeInventory](api-endpoint:Inventory-BatchChangeInventory) endpoint
#  when the seller has an active Retail Plus subscription.
    # @param measurement_unit [SquareApiClient::CatalogMeasurementUnit] The [CatalogMeasurementUnit](entity:CatalogMeasurementUnit) object representing
#  the catalog measurement unit associated with the inventory change.
    # @param measurement_unit_id [String] The ID of the [CatalogMeasurementUnit](entity:CatalogMeasurementUnit) object
#  representing the catalog measurement unit associated with the inventory change.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::InventoryChange]
    def initialize(type: OMIT, physical_count: OMIT, adjustment: OMIT, transfer: OMIT, measurement_unit: OMIT, measurement_unit_id: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @physical_count = physical_count if physical_count != OMIT
      @adjustment = adjustment if adjustment != OMIT
      @transfer = transfer if transfer != OMIT
      @measurement_unit = measurement_unit if measurement_unit != OMIT
      @measurement_unit_id = measurement_unit_id if measurement_unit_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "physical_count": physical_count, "adjustment": adjustment, "transfer": transfer, "measurement_unit": measurement_unit, "measurement_unit_id": measurement_unit_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InventoryChange
    #
    # @param json_object [String] 
    # @return [SquareApiClient::InventoryChange]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      unless parsed_json["physical_count"].nil?
        physical_count = parsed_json["physical_count"].to_json
        physical_count = SquareApiClient::InventoryPhysicalCount.from_json(json_object: physical_count)
      else
        physical_count = nil
      end
      unless parsed_json["adjustment"].nil?
        adjustment = parsed_json["adjustment"].to_json
        adjustment = SquareApiClient::InventoryAdjustment.from_json(json_object: adjustment)
      else
        adjustment = nil
      end
      unless parsed_json["transfer"].nil?
        transfer = parsed_json["transfer"].to_json
        transfer = SquareApiClient::InventoryTransfer.from_json(json_object: transfer)
      else
        transfer = nil
      end
      unless parsed_json["measurement_unit"].nil?
        measurement_unit = parsed_json["measurement_unit"].to_json
        measurement_unit = SquareApiClient::CatalogMeasurementUnit.from_json(json_object: measurement_unit)
      else
        measurement_unit = nil
      end
      measurement_unit_id = parsed_json["measurement_unit_id"]
      new(
        type: type,
        physical_count: physical_count,
        adjustment: adjustment,
        transfer: transfer,
        measurement_unit: measurement_unit,
        measurement_unit_id: measurement_unit_id,
        additional_properties: struct
      )
    end
# Serialize an instance of InventoryChange to a JSON object
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
      obj.type&.is_a?(SquareApiClient::InventoryChangeType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.physical_count.nil? || SquareApiClient::InventoryPhysicalCount.validate_raw(obj: obj.physical_count)
      obj.adjustment.nil? || SquareApiClient::InventoryAdjustment.validate_raw(obj: obj.adjustment)
      obj.transfer.nil? || SquareApiClient::InventoryTransfer.validate_raw(obj: obj.transfer)
      obj.measurement_unit.nil? || SquareApiClient::CatalogMeasurementUnit.validate_raw(obj: obj.measurement_unit)
      obj.measurement_unit_id&.is_a?(String) != false || raise("Passed value for field obj.measurement_unit_id is not the expected type, validation failed.")
    end
  end
end