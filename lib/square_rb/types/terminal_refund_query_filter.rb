# frozen_string_literal: true
require_relative "time_range"
require "ostruct"
require "json"

module SquareApiClient
  class TerminalRefundQueryFilter
  # @return [String] `TerminalRefund` objects associated with a specific device. If no device is
#  specified, then all
#  `TerminalRefund` objects for the signed-in account are displayed.
    attr_reader :device_id
  # @return [SquareApiClient::TimeRange] The timestamp for the beginning of the reporting period, in RFC 3339 format.
#  Inclusive.
#  Default value: The current time minus one day.
#  Note that `TerminalRefund`s are available for 30 days after creation.
    attr_reader :created_at
  # @return [String] Filtered results with the desired status of the `TerminalRefund`.
#  Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, or
#  `COMPLETED`.
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param device_id [String] `TerminalRefund` objects associated with a specific device. If no device is
#  specified, then all
#  `TerminalRefund` objects for the signed-in account are displayed.
    # @param created_at [SquareApiClient::TimeRange] The timestamp for the beginning of the reporting period, in RFC 3339 format.
#  Inclusive.
#  Default value: The current time minus one day.
#  Note that `TerminalRefund`s are available for 30 days after creation.
    # @param status [String] Filtered results with the desired status of the `TerminalRefund`.
#  Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, or
#  `COMPLETED`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TerminalRefundQueryFilter]
    def initialize(device_id: OMIT, created_at: OMIT, status: OMIT, additional_properties: nil)
      @device_id = device_id if device_id != OMIT
      @created_at = created_at if created_at != OMIT
      @status = status if status != OMIT
      @additional_properties = additional_properties
      @_field_set = { "device_id": device_id, "created_at": created_at, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TerminalRefundQueryFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TerminalRefundQueryFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      device_id = parsed_json["device_id"]
      unless parsed_json["created_at"].nil?
        created_at = parsed_json["created_at"].to_json
        created_at = SquareApiClient::TimeRange.from_json(json_object: created_at)
      else
        created_at = nil
      end
      status = parsed_json["status"]
      new(
        device_id: device_id,
        created_at: created_at,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of TerminalRefundQueryFilter to a JSON object
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
      obj.created_at.nil? || SquareApiClient::TimeRange.validate_raw(obj: obj.created_at)
      obj.status&.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end