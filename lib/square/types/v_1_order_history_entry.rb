# frozen_string_literal: true
require_relative "v_1_order_history_entry_action"
require "ostruct"
require "json"

module square.rb
# V1OrderHistoryEntry
  class V1OrderHistoryEntry
  # @return [square.rb::V1OrderHistoryEntryAction] The type of action performed on the order.
#  See [V1OrderHistoryEntryAction](#type-v1orderhistoryentryaction) for possible
#  values
    attr_reader :action
  # @return [String] The time when the action was performed, in ISO 8601 format.
    attr_reader :created_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param action [square.rb::V1OrderHistoryEntryAction] The type of action performed on the order.
#  See [V1OrderHistoryEntryAction](#type-v1orderhistoryentryaction) for possible
#  values
    # @param created_at [String] The time when the action was performed, in ISO 8601 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::V1OrderHistoryEntry]
    def initialize(action: OMIT, created_at: OMIT, additional_properties: nil)
      @action = action if action != OMIT
      @created_at = created_at if created_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "action": action, "created_at": created_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of V1OrderHistoryEntry
    #
    # @param json_object [String] 
    # @return [square.rb::V1OrderHistoryEntry]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      action = parsed_json["action"]
      created_at = parsed_json["created_at"]
      new(
        action: action,
        created_at: created_at,
        additional_properties: struct
      )
    end
# Serialize an instance of V1OrderHistoryEntry to a JSON object
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
      obj.action&.is_a?(square.rb::V1OrderHistoryEntryAction) != false || raise("Passed value for field obj.action is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
    end
  end
end