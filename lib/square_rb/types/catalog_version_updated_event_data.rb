# frozen_string_literal: true
require_relative "catalog_version_updated_event_object"
require "ostruct"
require "json"

module SquareApiClient
  class CatalogVersionUpdatedEventData
  # @return [String] Name of the affected object’s type.
    attr_reader :type
  # @return [SquareApiClient::CatalogVersionUpdatedEventObject] An object containing fields and values relevant to the event. Is absent if
#  affected object was deleted.
    attr_reader :object
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] Name of the affected object’s type.
    # @param object [SquareApiClient::CatalogVersionUpdatedEventObject] An object containing fields and values relevant to the event. Is absent if
#  affected object was deleted.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CatalogVersionUpdatedEventData]
    def initialize(type: OMIT, object: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @object = object if object != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "object": object }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogVersionUpdatedEventData
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CatalogVersionUpdatedEventData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      unless parsed_json["object"].nil?
        object = parsed_json["object"].to_json
        object = SquareApiClient::CatalogVersionUpdatedEventObject.from_json(json_object: object)
      else
        object = nil
      end
      new(
        type: type,
        object: object,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogVersionUpdatedEventData to a JSON object
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
      obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.object.nil? || SquareApiClient::CatalogVersionUpdatedEventObject.validate_raw(obj: obj.object)
    end
  end
end