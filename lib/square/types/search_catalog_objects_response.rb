# frozen_string_literal: true
require_relative "error"
require_relative "catalog_object"
require "ostruct"
require "json"

module square.rb
  class SearchCatalogObjectsResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [String] The pagination cursor to be used in a subsequent request. If unset, this is the
#  final response.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more information.
    attr_reader :cursor
  # @return [Array<square.rb::CatalogObject>] The CatalogObjects returned.
    attr_reader :objects
  # @return [Array<square.rb::CatalogObject>] A list of CatalogObjects referenced by the objects in the `objects` field.
    attr_reader :related_objects
  # @return [String] When the associated product catalog was last updated. Will
#  match the value for `end_time` or `cursor` if either field is included in the
#  `SearchCatalog` request.
    attr_reader :latest_time
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param cursor [String] The pagination cursor to be used in a subsequent request. If unset, this is the
#  final response.
#  See
#  https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination)
#  for more information.
    # @param objects [Array<square.rb::CatalogObject>] The CatalogObjects returned.
    # @param related_objects [Array<square.rb::CatalogObject>] A list of CatalogObjects referenced by the objects in the `objects` field.
    # @param latest_time [String] When the associated product catalog was last updated. Will
#  match the value for `end_time` or `cursor` if either field is included in the
#  `SearchCatalog` request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchCatalogObjectsResponse]
    def initialize(errors: OMIT, cursor: OMIT, objects: OMIT, related_objects: OMIT, latest_time: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @cursor = cursor if cursor != OMIT
      @objects = objects if objects != OMIT
      @related_objects = related_objects if related_objects != OMIT
      @latest_time = latest_time if latest_time != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "cursor": cursor, "objects": objects, "related_objects": related_objects, "latest_time": latest_time }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchCatalogObjectsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::SearchCatalogObjectsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      objects = parsed_json["objects"]&.map do | item |
  item = item.to_json
  square.rb::CatalogObject.from_json(json_object: item)
end
      related_objects = parsed_json["related_objects"]&.map do | item |
  item = item.to_json
  square.rb::CatalogObject.from_json(json_object: item)
end
      latest_time = parsed_json["latest_time"]
      new(
        errors: errors,
        cursor: cursor,
        objects: objects,
        related_objects: related_objects,
        latest_time: latest_time,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchCatalogObjectsResponse to a JSON object
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
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.objects&.is_a?(Array) != false || raise("Passed value for field obj.objects is not the expected type, validation failed.")
      obj.related_objects&.is_a?(Array) != false || raise("Passed value for field obj.related_objects is not the expected type, validation failed.")
      obj.latest_time&.is_a?(String) != false || raise("Passed value for field obj.latest_time is not the expected type, validation failed.")
    end
  end
end