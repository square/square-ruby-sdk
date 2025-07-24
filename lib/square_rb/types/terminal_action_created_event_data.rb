# frozen_string_literal: true
require_relative "terminal_action_created_event_object"
require "ostruct"
require "json"

module SquareApiClient
  class TerminalActionCreatedEventData
  # @return [String] Name of the created object’s type, `"action"`.
    attr_reader :type
  # @return [String] ID of the created terminal action.
    attr_reader :id
  # @return [SquareApiClient::TerminalActionCreatedEventObject] An object containing the created terminal action.
    attr_reader :object
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] Name of the created object’s type, `"action"`.
    # @param id [String] ID of the created terminal action.
    # @param object [SquareApiClient::TerminalActionCreatedEventObject] An object containing the created terminal action.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TerminalActionCreatedEventData]
    def initialize(type: OMIT, id: OMIT, object: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @id = id if id != OMIT
      @object = object if object != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "id": id, "object": object }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TerminalActionCreatedEventData
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TerminalActionCreatedEventData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      id = parsed_json["id"]
      unless parsed_json["object"].nil?
        object = parsed_json["object"].to_json
        object = SquareApiClient::TerminalActionCreatedEventObject.from_json(json_object: object)
      else
        object = nil
      end
      new(
        type: type,
        id: id,
        object: object,
        additional_properties: struct
      )
    end
# Serialize an instance of TerminalActionCreatedEventData to a JSON object
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
      obj.object.nil? || SquareApiClient::TerminalActionCreatedEventObject.validate_raw(obj: obj.object)
    end
  end
end