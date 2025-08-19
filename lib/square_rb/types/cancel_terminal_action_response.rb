# frozen_string_literal: true
require_relative "error"
require_relative "terminal_action"
require "ostruct"
require "json"

module SquareApiClient
  class CancelTerminalActionResponse
  # @return [Array<SquareApiClient::Error>] Information on errors encountered during the request.
    attr_reader :errors
  # @return [SquareApiClient::TerminalAction] The canceled `TerminalAction`
    attr_reader :action
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Information on errors encountered during the request.
    # @param action [SquareApiClient::TerminalAction] The canceled `TerminalAction`
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CancelTerminalActionResponse]
    def initialize(errors: OMIT, action: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @action = action if action != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "action": action }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CancelTerminalActionResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CancelTerminalActionResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["action"].nil?
        action = parsed_json["action"].to_json
        action = SquareApiClient::TerminalAction.from_json(json_object: action)
      else
        action = nil
      end
      new(
        errors: errors,
        action: action,
        additional_properties: struct
      )
    end
# Serialize an instance of CancelTerminalActionResponse to a JSON object
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
      obj.action.nil? || SquareApiClient::TerminalAction.validate_raw(obj: obj.action)
    end
  end
end