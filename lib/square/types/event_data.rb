# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class EventData
  # @return [String] The name of the affected object’s type.
    attr_reader :type
  # @return [String] The ID of the affected object.
    attr_reader :id
  # @return [Boolean] This is true if the affected object has been deleted; otherwise, it's absent.
    attr_reader :deleted
  # @return [Hash{String => Object}] An object containing fields and values relevant to the event. It is absent if
#  the affected object has been deleted.
    attr_reader :object
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] The name of the affected object’s type.
    # @param id [String] The ID of the affected object.
    # @param deleted [Boolean] This is true if the affected object has been deleted; otherwise, it's absent.
    # @param object [Hash{String => Object}] An object containing fields and values relevant to the event. It is absent if
#  the affected object has been deleted.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::EventData]
    def initialize(type: OMIT, id: OMIT, deleted: OMIT, object: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @id = id if id != OMIT
      @deleted = deleted if deleted != OMIT
      @object = object if object != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "id": id, "deleted": deleted, "object": object }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EventData
    #
    # @param json_object [String] 
    # @return [square.rb::EventData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      id = parsed_json["id"]
      deleted = parsed_json["deleted"]
      object = parsed_json["object"]
      new(
        type: type,
        id: id,
        deleted: deleted,
        object: object,
        additional_properties: struct
      )
    end
# Serialize an instance of EventData to a JSON object
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
      obj.deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.deleted is not the expected type, validation failed.")
      obj.object&.is_a?(Hash) != false || raise("Passed value for field obj.object is not the expected type, validation failed.")
    end
  end
end