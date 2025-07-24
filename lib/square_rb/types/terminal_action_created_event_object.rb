# frozen_string_literal: true
require_relative "terminal_action"
require "ostruct"
require "json"

module SquareApiClient
  class TerminalActionCreatedEventObject
  # @return [SquareApiClient::TerminalAction] The created terminal action.
    attr_reader :action
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param action [SquareApiClient::TerminalAction] The created terminal action.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TerminalActionCreatedEventObject]
    def initialize(action: OMIT, additional_properties: nil)
      @action = action if action != OMIT
      @additional_properties = additional_properties
      @_field_set = { "action": action }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TerminalActionCreatedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TerminalActionCreatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["action"].nil?
        action = parsed_json["action"].to_json
        action = SquareApiClient::TerminalAction.from_json(json_object: action)
      else
        action = nil
      end
      new(action: action, additional_properties: struct)
    end
# Serialize an instance of TerminalActionCreatedEventObject to a JSON object
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
      obj.action.nil? || SquareApiClient::TerminalAction.validate_raw(obj: obj.action)
    end
  end
end