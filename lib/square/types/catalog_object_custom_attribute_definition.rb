# frozen_string_literal: true
require_relative "catalog_custom_attribute_definition"
require_relative "catalog_v_1_id"
require "ostruct"
require "json"

module SquareApiClient
  class CatalogObjectCustomAttributeDefinition
  # @return [String] 
    attr_reader :type
  # @return [SquareApiClient::CatalogCustomAttributeDefinition] Structured data for a `CatalogCustomAttributeDefinition`, set for CatalogObjects
#  of type `CUSTOM_ATTRIBUTE_DEFINITION`.
    attr_reader :custom_attribute_definition_data
  # @return [String] An identifier to reference this object in the catalog. When a new
#  `CatalogObject`
#  is inserted, the client should set the id to a temporary identifier starting
#  with
#  a "`#`" character. Other objects being inserted or updated within the same
#  request
#  may use this identifier to refer to the new object.
#  When the server receives the new object, it will supply a unique identifier that
#  replaces the temporary identifier for all future references.
    attr_reader :id
  # @return [String] Last modification
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  in RFC 3339 format, e.g., `"2016-08-15T23:59:33.123Z"`
#  would indicate the UTC time (denoted by `Z`) of August 15, 2016 at 23:59:33 and
#  123 milliseconds.
    attr_reader :updated_at
  # @return [Long] The version of the object. When updating an object, the version supplied
#  must match the version in the database, otherwise the write will be rejected as
#  conflicting.
    attr_reader :version
  # @return [Boolean] If `true`, the object has been deleted from the database. Must be `false` for
#  new objects
#  being inserted. When deleted, the `updated_at` field will equal the deletion
#  time.
    attr_reader :is_deleted
  # @return [Hash{String => SquareApiClient::CatalogCustomAttributeValue}] A map (key-value pairs) of application-defined custom attribute values. The
#  value of a key-value pair
#  is a [CatalogCustomAttributeValue](entity:CatalogCustomAttributeValue) object.
#  The key is the `key` attribute
#  value defined in the associated
#  [CatalogCustomAttributeDefinition](entity:CatalogCustomAttributeDefinition)
#  object defined by the application making the request.
#  If the `CatalogCustomAttributeDefinition` object is
#  defined by another application, the `CatalogCustomAttributeDefinition`'s key
#  attribute value is prefixed by
#  the defining application ID. For example, if the
#  `CatalogCustomAttributeDefinition` has a `key` attribute of
#  `"cocoa_brand"` and the defining application ID is `"abcd1234"`, the key in the
#  map is `"abcd1234:cocoa_brand"`
#  if the application making the request is different from the application defining
#  the custom attribute definition.
#  Otherwise, the key used in the map is simply `"cocoa_brand"`.
#  Application-defined custom attributes are set at a global (location-independent)
#  level.
#  Custom attribute values are intended to store additional information about a
#  catalog object
#  or associations with an entity in another system. Do not use custom attributes
#  to store any sensitive information (personally identifiable information, card
#  details, etc.).
    attr_reader :custom_attribute_values
  # @return [Array<SquareApiClient::CatalogV1Id>] The Connect v1 IDs for this object at each location where it is present, where
#  they
#  differ from the object's Connect V2 ID. The field will only be present for
#  objects that
#  have been created or modified by legacy APIs.
    attr_reader :catalog_v_1_ids
  # @return [Boolean] If `true`, this object is present at all locations (including future locations),
#  except where specified in
#  the `absent_at_location_ids` field. If `false`, this object is not present at
#  any locations (including future locations),
#  except where specified in the `present_at_location_ids` field. If not specified,
#  defaults to `true`.
    attr_reader :present_at_all_locations
  # @return [Array<String>] A list of locations where the object is present, even if
#  `present_at_all_locations` is `false`.
#  This can include locations that are deactivated.
    attr_reader :present_at_location_ids
  # @return [Array<String>] A list of locations where the object is not present, even if
#  `present_at_all_locations` is `true`.
#  This can include locations that are deactivated.
    attr_reader :absent_at_location_ids
  # @return [String] Identifies the `CatalogImage` attached to this `CatalogObject`.
    attr_reader :image_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] 
    # @param custom_attribute_definition_data [SquareApiClient::CatalogCustomAttributeDefinition] Structured data for a `CatalogCustomAttributeDefinition`, set for CatalogObjects
#  of type `CUSTOM_ATTRIBUTE_DEFINITION`.
    # @param id [String] An identifier to reference this object in the catalog. When a new
#  `CatalogObject`
#  is inserted, the client should set the id to a temporary identifier starting
#  with
#  a "`#`" character. Other objects being inserted or updated within the same
#  request
#  may use this identifier to refer to the new object.
#  When the server receives the new object, it will supply a unique identifier that
#  replaces the temporary identifier for all future references.
    # @param updated_at [String] Last modification
#  [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)
#  in RFC 3339 format, e.g., `"2016-08-15T23:59:33.123Z"`
#  would indicate the UTC time (denoted by `Z`) of August 15, 2016 at 23:59:33 and
#  123 milliseconds.
    # @param version [Long] The version of the object. When updating an object, the version supplied
#  must match the version in the database, otherwise the write will be rejected as
#  conflicting.
    # @param is_deleted [Boolean] If `true`, the object has been deleted from the database. Must be `false` for
#  new objects
#  being inserted. When deleted, the `updated_at` field will equal the deletion
#  time.
    # @param custom_attribute_values [Hash{String => SquareApiClient::CatalogCustomAttributeValue}] A map (key-value pairs) of application-defined custom attribute values. The
#  value of a key-value pair
#  is a [CatalogCustomAttributeValue](entity:CatalogCustomAttributeValue) object.
#  The key is the `key` attribute
#  value defined in the associated
#  [CatalogCustomAttributeDefinition](entity:CatalogCustomAttributeDefinition)
#  object defined by the application making the request.
#  If the `CatalogCustomAttributeDefinition` object is
#  defined by another application, the `CatalogCustomAttributeDefinition`'s key
#  attribute value is prefixed by
#  the defining application ID. For example, if the
#  `CatalogCustomAttributeDefinition` has a `key` attribute of
#  `"cocoa_brand"` and the defining application ID is `"abcd1234"`, the key in the
#  map is `"abcd1234:cocoa_brand"`
#  if the application making the request is different from the application defining
#  the custom attribute definition.
#  Otherwise, the key used in the map is simply `"cocoa_brand"`.
#  Application-defined custom attributes are set at a global (location-independent)
#  level.
#  Custom attribute values are intended to store additional information about a
#  catalog object
#  or associations with an entity in another system. Do not use custom attributes
#  to store any sensitive information (personally identifiable information, card
#  details, etc.).
    # @param catalog_v_1_ids [Array<SquareApiClient::CatalogV1Id>] The Connect v1 IDs for this object at each location where it is present, where
#  they
#  differ from the object's Connect V2 ID. The field will only be present for
#  objects that
#  have been created or modified by legacy APIs.
    # @param present_at_all_locations [Boolean] If `true`, this object is present at all locations (including future locations),
#  except where specified in
#  the `absent_at_location_ids` field. If `false`, this object is not present at
#  any locations (including future locations),
#  except where specified in the `present_at_location_ids` field. If not specified,
#  defaults to `true`.
    # @param present_at_location_ids [Array<String>] A list of locations where the object is present, even if
#  `present_at_all_locations` is `false`.
#  This can include locations that are deactivated.
    # @param absent_at_location_ids [Array<String>] A list of locations where the object is not present, even if
#  `present_at_all_locations` is `true`.
#  This can include locations that are deactivated.
    # @param image_id [String] Identifies the `CatalogImage` attached to this `CatalogObject`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogObjectCustomAttributeDefinition]
    def initialize(type:, custom_attribute_definition_data: OMIT, id:, updated_at: OMIT, version: OMIT, is_deleted: OMIT, custom_attribute_values: OMIT, catalog_v_1_ids: OMIT, present_at_all_locations: OMIT, present_at_location_ids: OMIT, absent_at_location_ids: OMIT, image_id: OMIT, additional_properties: nil)
      @type = type
      @custom_attribute_definition_data = custom_attribute_definition_data if custom_attribute_definition_data != OMIT
      @id = id
      @updated_at = updated_at if updated_at != OMIT
      @version = version if version != OMIT
      @is_deleted = is_deleted if is_deleted != OMIT
      @custom_attribute_values = custom_attribute_values if custom_attribute_values != OMIT
      @catalog_v_1_ids = catalog_v_1_ids if catalog_v_1_ids != OMIT
      @present_at_all_locations = present_at_all_locations if present_at_all_locations != OMIT
      @present_at_location_ids = present_at_location_ids if present_at_location_ids != OMIT
      @absent_at_location_ids = absent_at_location_ids if absent_at_location_ids != OMIT
      @image_id = image_id if image_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "custom_attribute_definition_data": custom_attribute_definition_data, "id": id, "updated_at": updated_at, "version": version, "is_deleted": is_deleted, "custom_attribute_values": custom_attribute_values, "catalog_v1_ids": catalog_v_1_ids, "present_at_all_locations": present_at_all_locations, "present_at_location_ids": present_at_location_ids, "absent_at_location_ids": absent_at_location_ids, "image_id": image_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CatalogObjectCustomAttributeDefinition
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogObjectCustomAttributeDefinition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      unless parsed_json["custom_attribute_definition_data"].nil?
        custom_attribute_definition_data = parsed_json["custom_attribute_definition_data"].to_json
        custom_attribute_definition_data = SquareApiClient::CatalogCustomAttributeDefinition.from_json(json_object: custom_attribute_definition_data)
      else
        custom_attribute_definition_data = nil
      end
      id = parsed_json["id"]
      updated_at = parsed_json["updated_at"]
      version = parsed_json["version"]
      is_deleted = parsed_json["is_deleted"]
      custom_attribute_values = parsed_json["custom_attribute_values"]&.transform_values do | value |
  value = value.to_json
  SquareApiClient::CatalogCustomAttributeValue.from_json(json_object: value)
end
      catalog_v_1_ids = parsed_json["catalog_v1_ids"]&.map do | item |
  item = item.to_json
  SquareApiClient::CatalogV1Id.from_json(json_object: item)
end
      present_at_all_locations = parsed_json["present_at_all_locations"]
      present_at_location_ids = parsed_json["present_at_location_ids"]
      absent_at_location_ids = parsed_json["absent_at_location_ids"]
      image_id = parsed_json["image_id"]
      new(
        type: type,
        custom_attribute_definition_data: custom_attribute_definition_data,
        id: id,
        updated_at: updated_at,
        version: version,
        is_deleted: is_deleted,
        custom_attribute_values: custom_attribute_values,
        catalog_v_1_ids: catalog_v_1_ids,
        present_at_all_locations: present_at_all_locations,
        present_at_location_ids: present_at_location_ids,
        absent_at_location_ids: absent_at_location_ids,
        image_id: image_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogObjectCustomAttributeDefinition to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.custom_attribute_definition_data.nil? || SquareApiClient::CatalogCustomAttributeDefinition.validate_raw(obj: obj.custom_attribute_definition_data)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.version&.is_a?(Long) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.is_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.is_deleted is not the expected type, validation failed.")
      obj.custom_attribute_values&.is_a?(Hash) != false || raise("Passed value for field obj.custom_attribute_values is not the expected type, validation failed.")
      obj.catalog_v_1_ids&.is_a?(Array) != false || raise("Passed value for field obj.catalog_v_1_ids is not the expected type, validation failed.")
      obj.present_at_all_locations&.is_a?(Boolean) != false || raise("Passed value for field obj.present_at_all_locations is not the expected type, validation failed.")
      obj.present_at_location_ids&.is_a?(Array) != false || raise("Passed value for field obj.present_at_location_ids is not the expected type, validation failed.")
      obj.absent_at_location_ids&.is_a?(Array) != false || raise("Passed value for field obj.absent_at_location_ids is not the expected type, validation failed.")
      obj.image_id&.is_a?(String) != false || raise("Passed value for field obj.image_id is not the expected type, validation failed.")
    end
  end
end