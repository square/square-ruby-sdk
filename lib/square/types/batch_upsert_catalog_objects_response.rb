# frozen_string_literal: true
require_relative "error"
require_relative "catalog_object"
require_relative "catalog_id_mapping"
require "ostruct"
require "json"

module square.rb
  class BatchUpsertCatalogObjectsResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<square.rb::CatalogObject>] The created successfully created CatalogObjects.
    attr_reader :objects
  # @return [String] The database
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  of this update in RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
    attr_reader :updated_at
  # @return [Array<square.rb::CatalogIdMapping>] The mapping between client and server IDs for this upsert.
    attr_reader :id_mappings
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param objects [Array<square.rb::CatalogObject>] The created successfully created CatalogObjects.
    # @param updated_at [String] The database
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  of this update in RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
    # @param id_mappings [Array<square.rb::CatalogIdMapping>] The mapping between client and server IDs for this upsert.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BatchUpsertCatalogObjectsResponse]
    def initialize(errors: OMIT, objects: OMIT, updated_at: OMIT, id_mappings: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @objects = objects if objects != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @id_mappings = id_mappings if id_mappings != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "objects": objects, "updated_at": updated_at, "id_mappings": id_mappings }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BatchUpsertCatalogObjectsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::BatchUpsertCatalogObjectsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      objects = parsed_json["objects"]&.map do | item |
  item = item.to_json
  square.rb::CatalogObject.from_json(json_object: item)
end
      updated_at = parsed_json["updated_at"]
      id_mappings = parsed_json["id_mappings"]&.map do | item |
  item = item.to_json
  square.rb::CatalogIdMapping.from_json(json_object: item)
end
      new(
        errors: errors,
        objects: objects,
        updated_at: updated_at,
        id_mappings: id_mappings,
        additional_properties: struct
      )
    end
# Serialize an instance of BatchUpsertCatalogObjectsResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.objects&.is_a?(Array) != false || raise("Passed value for field obj.objects is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.id_mappings&.is_a?(Array) != false || raise("Passed value for field obj.id_mappings is not the expected type, validation failed.")
    end
  end
end