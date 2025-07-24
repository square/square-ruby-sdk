# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# A named selection for this `SELECTION`-type custom attribute definition.
  class CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection
  # @return [String] Unique ID set by Square.
    attr_reader :uid
  # @return [String] Selection name, unique within `allowed_selections`.
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] Unique ID set by Square.
    # @param name [String] Selection name, unique within `allowed_selections`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection]
    def initialize(uid: OMIT, name:, additional_properties: nil)
      @uid = uid if uid != OMIT
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      name = parsed_json["name"]
      new(
        uid: uid,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of
#  CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection to a
#  JSON object
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
      obj.uid&.is_a?(String) != false || raise("Passed value for field obj.uid is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end