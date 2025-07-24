# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class LaborScheduledShiftDeletedEventData
  # @return [String] The type of object affected by the event. For this event, the value is
#  `scheduled_shift`.
    attr_reader :type
  # @return [String] The ID of the affected `ScheduledShift`.
    attr_reader :id
  # @return [Boolean] Is true if the affected object was deleted. Otherwise absent.
    attr_reader :deleted
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] The type of object affected by the event. For this event, the value is
#  `scheduled_shift`.
    # @param id [String] The ID of the affected `ScheduledShift`.
    # @param deleted [Boolean] Is true if the affected object was deleted. Otherwise absent.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LaborScheduledShiftDeletedEventData]
    def initialize(type: OMIT, id: OMIT, deleted: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @id = id if id != OMIT
      @deleted = deleted if deleted != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "id": id, "deleted": deleted }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LaborScheduledShiftDeletedEventData
    #
    # @param json_object [String] 
    # @return [square.rb::LaborScheduledShiftDeletedEventData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      id = parsed_json["id"]
      deleted = parsed_json["deleted"]
      new(
        type: type,
        id: id,
        deleted: deleted,
        additional_properties: struct
      )
    end
# Serialize an instance of LaborScheduledShiftDeletedEventData to a JSON object
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
    end
  end
end