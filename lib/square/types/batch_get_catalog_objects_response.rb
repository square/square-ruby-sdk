# frozen_string_literal: true
require_relative "error"
require_relative "catalog_object"
require "ostruct"
require "json"

module square.rb
  class BatchGetCatalogObjectsResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<square.rb::CatalogObject>] A list of [CatalogObject](entity:CatalogObject)s returned.
    attr_reader :objects
  # @return [Array<square.rb::CatalogObject>] A list of [CatalogObject](entity:CatalogObject)s referenced by the object in the
#  `objects` field.
    attr_reader :related_objects
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param objects [Array<square.rb::CatalogObject>] A list of [CatalogObject](entity:CatalogObject)s returned.
    # @param related_objects [Array<square.rb::CatalogObject>] A list of [CatalogObject](entity:CatalogObject)s referenced by the object in the
#  `objects` field.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::BatchGetCatalogObjectsResponse]
    def initialize(errors: OMIT, objects: OMIT, related_objects: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @objects = objects if objects != OMIT
      @related_objects = related_objects if related_objects != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "objects": objects, "related_objects": related_objects }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BatchGetCatalogObjectsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::BatchGetCatalogObjectsResponse]
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
      related_objects = parsed_json["related_objects"]&.map do | item |
  item = item.to_json
  square.rb::CatalogObject.from_json(json_object: item)
end
      new(
        errors: errors,
        objects: objects,
        related_objects: related_objects,
        additional_properties: struct
      )
    end
# Serialize an instance of BatchGetCatalogObjectsResponse to a JSON object
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
      obj.related_objects&.is_a?(Array) != false || raise("Passed value for field obj.related_objects is not the expected type, validation failed.")
    end
  end
end