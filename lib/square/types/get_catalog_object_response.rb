# frozen_string_literal: true
require_relative "error"
require_relative "catalog_object"
require "ostruct"
require "json"

module square.rb
  class GetCatalogObjectResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::CatalogObject] The `CatalogObject`s returned.
    attr_reader :object
  # @return [Array<square.rb::CatalogObject>] A list of `CatalogObject`s referenced by the object in the `object` field.
    attr_reader :related_objects
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param object [square.rb::CatalogObject] The `CatalogObject`s returned.
    # @param related_objects [Array<square.rb::CatalogObject>] A list of `CatalogObject`s referenced by the object in the `object` field.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetCatalogObjectResponse]
    def initialize(errors: OMIT, object: OMIT, related_objects: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @object = object if object != OMIT
      @related_objects = related_objects if related_objects != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "object": object, "related_objects": related_objects }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetCatalogObjectResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetCatalogObjectResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["object"].nil?
        object = parsed_json["object"].to_json
        object = square.rb::CatalogObject.from_json(json_object: object)
      else
        object = nil
      end
      related_objects = parsed_json["related_objects"]&.map do | item |
  item = item.to_json
  square.rb::CatalogObject.from_json(json_object: item)
end
      new(
        errors: errors,
        object: object,
        related_objects: related_objects,
        additional_properties: struct
      )
    end
# Serialize an instance of GetCatalogObjectResponse to a JSON object
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
      obj.object.nil? || square.rb::CatalogObject.validate_raw(obj: obj.object)
      obj.related_objects&.is_a?(Array) != false || raise("Passed value for field obj.related_objects is not the expected type, validation failed.")
    end
  end
end