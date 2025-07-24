# frozen_string_literal: true
require_relative "terminal_action"
require "ostruct"
require "json"

module square.rb
  class TerminalActionUpdatedEventObject
  # @return [square.rb::TerminalAction] The updated terminal action.
    attr_reader :action
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param action [square.rb::TerminalAction] The updated terminal action.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::TerminalActionUpdatedEventObject]
    def initialize(action: OMIT, additional_properties: nil)
      @action = action if action != OMIT
      @additional_properties = additional_properties
      @_field_set = { "action": action }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TerminalActionUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::TerminalActionUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["action"].nil?
        action = parsed_json["action"].to_json
        action = square.rb::TerminalAction.from_json(json_object: action)
      else
        action = nil
      end
      new(action: action, additional_properties: struct)
    end
# Serialize an instance of TerminalActionUpdatedEventObject to a JSON object
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
      obj.action.nil? || square.rb::TerminalAction.validate_raw(obj: obj.action)
    end
  end
end