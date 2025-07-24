# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class CatalogVersionUpdatedEventCatalogVersion
  # @return [String] Last modification timestamp in RFC 3339 format.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param updated_at [String] Last modification timestamp in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogVersionUpdatedEventCatalogVersion]
    def initialize(updated_at: OMIT, additional_properties: nil)
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CatalogVersionUpdatedEventCatalogVersion
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogVersionUpdatedEventCatalogVersion]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      updated_at = parsed_json["updated_at"]
      new(updated_at: updated_at, additional_properties: struct)
    end
# Serialize an instance of CatalogVersionUpdatedEventCatalogVersion to a JSON
#  object
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
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end