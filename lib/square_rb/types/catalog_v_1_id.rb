# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# A Square API V1 identifier of an item, including the object ID and its
#  associated location ID.
  class CatalogV1Id
  # @return [String] The ID for an object used in the Square API V1, if the object ID differs from
#  the Square API V2 object ID.
    attr_reader :catalog_v_1_id
  # @return [String] The ID of the `Location` this Connect V1 ID is associated with.
    attr_reader :location_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param catalog_v_1_id [String] The ID for an object used in the Square API V1, if the object ID differs from
#  the Square API V2 object ID.
    # @param location_id [String] The ID of the `Location` this Connect V1 ID is associated with.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogV1Id]
    def initialize(catalog_v_1_id: OMIT, location_id: OMIT, additional_properties: nil)
      @catalog_v_1_id = catalog_v_1_id if catalog_v_1_id != OMIT
      @location_id = location_id if location_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "catalog_v1_id": catalog_v_1_id, "location_id": location_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogV1Id
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogV1Id]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      catalog_v_1_id = parsed_json["catalog_v1_id"]
      location_id = parsed_json["location_id"]
      new(
        catalog_v_1_id: catalog_v_1_id,
        location_id: location_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogV1Id to a JSON object
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
      obj.catalog_v_1_id&.is_a?(String) != false || raise("Passed value for field obj.catalog_v_1_id is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
    end
  end
end