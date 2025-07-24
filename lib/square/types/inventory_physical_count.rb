# frozen_string_literal: true
require_relative "inventory_state"
require_relative "source_application"
require "ostruct"
require "json"

module square.rb
# Represents the quantity of an item variation that is physically present
#  at a specific location, verified by a seller or a seller's employee. For
#  example,
#  a physical count might come from an employee counting the item variations on
#  hand or from syncing with an external system.
  class InventoryPhysicalCount
  # @return [String] A unique Square-generated ID for the
#  [InventoryPhysicalCount](entity:InventoryPhysicalCount).
    attr_reader :id
  # @return [String] An optional ID provided by the application to tie the
#  [InventoryPhysicalCount](entity:InventoryPhysicalCount) to an external
#  system.
    attr_reader :reference_id
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
  # @return [square.rb::InventoryState] The current [inventory state](entity:InventoryState) for the related
#  quantity of items.
#  See [InventoryState](#type-inventorystate) for possible values
    attr_reader :state
  # @return [String] The Square-generated ID of the [Location](entity:Location) where the related
#  quantity of items is being tracked.
    attr_reader :location_id
  # @return [String] The number of items affected by the physical count as a decimal string.
#  The number can support up to 5 digits after the decimal point.
    attr_reader :quantity
  # @return [square.rb::SourceApplication] Information about the application with which the
#  physical count is submitted.
    attr_reader :source
  # @return [String] The Square-generated ID of the [Employee](entity:Employee) responsible for the
#  physical count.
    attr_reader :employee_id
  # @return [String] The Square-generated ID of the [Team Member](entity:TeamMember) responsible for
#  the
#  physical count.
    attr_reader :team_member_id
  # @return [String] A client-generated RFC 3339-formatted timestamp that indicates when
#  the physical count was examined. For physical count updates, the `occurred_at`
#  timestamp cannot be older than 24 hours or in the future relative to the
#  time of the request.
    attr_reader :occurred_at
  # @return [String] An RFC 3339-formatted timestamp that indicates when the physical count is
#  received.
    attr_reader :created_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique Square-generated ID for the
#  [InventoryPhysicalCount](entity:InventoryPhysicalCount).
    # @param reference_id [String] An optional ID provided by the application to tie the
#  [InventoryPhysicalCount](entity:InventoryPhysicalCount) to an external
#  system.
    # @param catalog_object_id [String] The Square-generated ID of the
#  [CatalogObject](entity:CatalogObject) being tracked.
    # @param catalog_object_type [String] The [type](entity:CatalogObjectType) of the
#  [CatalogObject](entity:CatalogObject) being tracked.
#  The Inventory API supports setting and reading the `"catalog_object_type":
#  "ITEM_VARIATION"` field value.
#  In addition, it can also read the `"catalog_object_type": "ITEM"` field value
#  that is set by the Square Restaurants app.
    # @param state [square.rb::InventoryState] The current [inventory state](entity:InventoryState) for the related
#  quantity of items.
#  See [InventoryState](#type-inventorystate) for possible values
    # @param location_id [String] The Square-generated ID of the [Location](entity:Location) where the related
#  quantity of items is being tracked.
    # @param quantity [String] The number of items affected by the physical count as a decimal string.
#  The number can support up to 5 digits after the decimal point.
    # @param source [square.rb::SourceApplication] Information about the application with which the
#  physical count is submitted.
    # @param employee_id [String] The Square-generated ID of the [Employee](entity:Employee) responsible for the
#  physical count.
    # @param team_member_id [String] The Square-generated ID of the [Team Member](entity:TeamMember) responsible for
#  the
#  physical count.
    # @param occurred_at [String] A client-generated RFC 3339-formatted timestamp that indicates when
#  the physical count was examined. For physical count updates, the `occurred_at`
#  timestamp cannot be older than 24 hours or in the future relative to the
#  time of the request.
    # @param created_at [String] An RFC 3339-formatted timestamp that indicates when the physical count is
#  received.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::InventoryPhysicalCount]
    def initialize(id: OMIT, reference_id: OMIT, catalog_object_id: OMIT, catalog_object_type: OMIT, state: OMIT, location_id: OMIT, quantity: OMIT, source: OMIT, employee_id: OMIT, team_member_id: OMIT, occurred_at: OMIT, created_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @reference_id = reference_id if reference_id != OMIT
      @catalog_object_id = catalog_object_id if catalog_object_id != OMIT
      @catalog_object_type = catalog_object_type if catalog_object_type != OMIT
      @state = state if state != OMIT
      @location_id = location_id if location_id != OMIT
      @quantity = quantity if quantity != OMIT
      @source = source if source != OMIT
      @employee_id = employee_id if employee_id != OMIT
      @team_member_id = team_member_id if team_member_id != OMIT
      @occurred_at = occurred_at if occurred_at != OMIT
      @created_at = created_at if created_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "reference_id": reference_id, "catalog_object_id": catalog_object_id, "catalog_object_type": catalog_object_type, "state": state, "location_id": location_id, "quantity": quantity, "source": source, "employee_id": employee_id, "team_member_id": team_member_id, "occurred_at": occurred_at, "created_at": created_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InventoryPhysicalCount
    #
    # @param json_object [String] 
    # @return [square.rb::InventoryPhysicalCount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      reference_id = parsed_json["reference_id"]
      catalog_object_id = parsed_json["catalog_object_id"]
      catalog_object_type = parsed_json["catalog_object_type"]
      state = parsed_json["state"]
      location_id = parsed_json["location_id"]
      quantity = parsed_json["quantity"]
      unless parsed_json["source"].nil?
        source = parsed_json["source"].to_json
        source = square.rb::SourceApplication.from_json(json_object: source)
      else
        source = nil
      end
      employee_id = parsed_json["employee_id"]
      team_member_id = parsed_json["team_member_id"]
      occurred_at = parsed_json["occurred_at"]
      created_at = parsed_json["created_at"]
      new(
        id: id,
        reference_id: reference_id,
        catalog_object_id: catalog_object_id,
        catalog_object_type: catalog_object_type,
        state: state,
        location_id: location_id,
        quantity: quantity,
        source: source,
        employee_id: employee_id,
        team_member_id: team_member_id,
        occurred_at: occurred_at,
        created_at: created_at,
        additional_properties: struct
      )
    end
# Serialize an instance of InventoryPhysicalCount to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.reference_id&.is_a?(String) != false || raise("Passed value for field obj.reference_id is not the expected type, validation failed.")
      obj.catalog_object_id&.is_a?(String) != false || raise("Passed value for field obj.catalog_object_id is not the expected type, validation failed.")
      obj.catalog_object_type&.is_a?(String) != false || raise("Passed value for field obj.catalog_object_type is not the expected type, validation failed.")
      obj.state&.is_a?(square.rb::InventoryState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.quantity&.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
      obj.source.nil? || square.rb::SourceApplication.validate_raw(obj: obj.source)
      obj.employee_id&.is_a?(String) != false || raise("Passed value for field obj.employee_id is not the expected type, validation failed.")
      obj.team_member_id&.is_a?(String) != false || raise("Passed value for field obj.team_member_id is not the expected type, validation failed.")
      obj.occurred_at&.is_a?(String) != false || raise("Passed value for field obj.occurred_at is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
    end
  end
end