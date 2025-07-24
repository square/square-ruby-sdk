# frozen_string_literal: true
require_relative "inventory_state"
require "ostruct"
require "json"

module square.rb
  class BatchGetInventoryCountsRequest
  # @return [Array<String>] The filter to return results by `CatalogObject` ID.
#  The filter is applicable only when set.  The default is null.
    attr_reader :catalog_object_ids
  # @return [Array<String>] The filter to return results by `Location` ID.
#  This filter is applicable only when set. The default is null.
    attr_reader :location_ids
  # @return [String] The filter to return results with their `calculated_at` value
#  after the given time as specified in an RFC 3339 timestamp.
#  The default value is the UNIX epoch of (`1970-01-01T00:00:00Z`).
    attr_reader :updated_after
  # @return [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for the original query.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    attr_reader :cursor
  # @return [Array<square.rb::InventoryState>] The filter to return results by `InventoryState`. The filter is only applicable
#  when set.
#  Ignored are untracked states of `NONE`, `SOLD`, and `UNLINKED_RETURN`.
#  The default is null.
    attr_reader :states
  # @return [Integer] The number of [records](entity:InventoryCount) to return.
    attr_reader :limit
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param catalog_object_ids [Array<String>] The filter to return results by `CatalogObject` ID.
#  The filter is applicable only when set.  The default is null.
    # @param location_ids [Array<String>] The filter to return results by `Location` ID.
#  This filter is applicable only when set. The default is null.
    # @param updated_after [String] The filter to return results with their `calculated_at` value
#  after the given time as specified in an RFC 3339 timestamp.
#  The default value is the UNIX epoch of (`1970-01-01T00:00:00Z`).
    # @param cursor [String] A pagination cursor returned by a previous call to this endpoint.
#  Provide this to retrieve the next set of results for the original query.
#  See the
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination)
#  guide for more information.
    # @param states [Array<square.rb::InventoryState>] The filter to return results by `InventoryState`. The filter is only applicable
#  when set.
#  Ignored are untracked states of `NONE`, `SOLD`, and `UNLINKED_RETURN`.
#  The default is null.
    # @param limit [Integer] The number of [records](entity:InventoryCount) to return.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BatchGetInventoryCountsRequest]
    def initialize(catalog_object_ids: OMIT, location_ids: OMIT, updated_after: OMIT, cursor: OMIT, states: OMIT, limit: OMIT, additional_properties: nil)
      @catalog_object_ids = catalog_object_ids if catalog_object_ids != OMIT
      @location_ids = location_ids if location_ids != OMIT
      @updated_after = updated_after if updated_after != OMIT
      @cursor = cursor if cursor != OMIT
      @states = states if states != OMIT
      @limit = limit if limit != OMIT
      @additional_properties = additional_properties
      @_field_set = { "catalog_object_ids": catalog_object_ids, "location_ids": location_ids, "updated_after": updated_after, "cursor": cursor, "states": states, "limit": limit }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BatchGetInventoryCountsRequest
    #
    # @param json_object [String] 
    # @return [square.rb::BatchGetInventoryCountsRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      catalog_object_ids = parsed_json["catalog_object_ids"]
      location_ids = parsed_json["location_ids"]
      updated_after = parsed_json["updated_after"]
      cursor = parsed_json["cursor"]
      states = parsed_json["states"]
      limit = parsed_json["limit"]
      new(
        catalog_object_ids: catalog_object_ids,
        location_ids: location_ids,
        updated_after: updated_after,
        cursor: cursor,
        states: states,
        limit: limit,
        additional_properties: struct
      )
    end
# Serialize an instance of BatchGetInventoryCountsRequest to a JSON object
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
      obj.catalog_object_ids&.is_a?(Array) != false || raise("Passed value for field obj.catalog_object_ids is not the expected type, validation failed.")
      obj.location_ids&.is_a?(Array) != false || raise("Passed value for field obj.location_ids is not the expected type, validation failed.")
      obj.updated_after&.is_a?(String) != false || raise("Passed value for field obj.updated_after is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.states&.is_a?(Array) != false || raise("Passed value for field obj.states is not the expected type, validation failed.")
      obj.limit&.is_a?(Integer) != false || raise("Passed value for field obj.limit is not the expected type, validation failed.")
    end
  end
end