# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class LocationCreatedEventData
  # @return [String] Name of the affected object’s type, `"location"`.
    attr_reader :type
  # @return [String] ID of the updated [Location](entity:Location).
    attr_reader :id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] Name of the affected object’s type, `"location"`.
    # @param id [String] ID of the updated [Location](entity:Location).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LocationCreatedEventData]
    def initialize(type: OMIT, id: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @id = id if id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "id": id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LocationCreatedEventData
    #
    # @param json_object [String] 
    # @return [square.rb::LocationCreatedEventData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      id = parsed_json["id"]
      new(
        type: type,
        id: id,
        additional_properties: struct
      )
    end
# Serialize an instance of LocationCreatedEventData to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
    end
  end
end