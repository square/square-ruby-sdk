# frozen_string_literal: true
require_relative "time_range"
require_relative "terminal_action_action_type"
require "ostruct"
require "json"

module square.rb
  class TerminalActionQueryFilter
  # @return [String] `TerminalAction`s associated with a specific device. If no device is specified
#  then all
#  `TerminalAction`s for the merchant will be displayed.
    attr_reader :device_id
  # @return [square.rb::TimeRange] Time range for the beginning of the reporting period. Inclusive.
#  Default value: The current time minus one day.
#  Note that `TerminalAction`s are available for 30 days after creation.
    attr_reader :created_at
  # @return [String] Filter results with the desired status of the `TerminalAction`
#  Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, `COMPLETED`
    attr_reader :status
  # @return [square.rb::TerminalActionActionType] Filter results with the requested ActionType.
#  See [TerminalActionActionType](#type-terminalactionactiontype) for possible
#  values
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param device_id [String] `TerminalAction`s associated with a specific device. If no device is specified
#  then all
#  `TerminalAction`s for the merchant will be displayed.
    # @param created_at [square.rb::TimeRange] Time range for the beginning of the reporting period. Inclusive.
#  Default value: The current time minus one day.
#  Note that `TerminalAction`s are available for 30 days after creation.
    # @param status [String] Filter results with the desired status of the `TerminalAction`
#  Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, `COMPLETED`
    # @param type [square.rb::TerminalActionActionType] Filter results with the requested ActionType.
#  See [TerminalActionActionType](#type-terminalactionactiontype) for possible
#  values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::TerminalActionQueryFilter]
    def initialize(device_id: OMIT, created_at: OMIT, status: OMIT, type: OMIT, additional_properties: nil)
      @device_id = device_id if device_id != OMIT
      @created_at = created_at if created_at != OMIT
      @status = status if status != OMIT
      @type = type if type != OMIT
      @additional_properties = additional_properties
      @_field_set = { "device_id": device_id, "created_at": created_at, "status": status, "type": type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TerminalActionQueryFilter
    #
    # @param json_object [String] 
    # @return [square.rb::TerminalActionQueryFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      device_id = parsed_json["device_id"]
      unless parsed_json["created_at"].nil?
        created_at = parsed_json["created_at"].to_json
        created_at = square.rb::TimeRange.from_json(json_object: created_at)
      else
        created_at = nil
      end
      status = parsed_json["status"]
      type = parsed_json["type"]
      new(
        device_id: device_id,
        created_at: created_at,
        status: status,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of TerminalActionQueryFilter to a JSON object
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
      obj.device_id&.is_a?(String) != false || raise("Passed value for field obj.device_id is not the expected type, validation failed.")
      obj.created_at.nil? || square.rb::TimeRange.validate_raw(obj: obj.created_at)
      obj.status&.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.type&.is_a?(square.rb::TerminalActionActionType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end