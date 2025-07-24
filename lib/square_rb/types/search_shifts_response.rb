# frozen_string_literal: true
require_relative "shift"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# The response to a request for `Shift` objects. The response contains
#  the requested `Shift` objects and might contain a set of `Error` objects if
#  the request resulted in errors.
  class SearchShiftsResponse
  # @return [Array<SquareApiClient::Shift>] Shifts.
    attr_reader :shifts
  # @return [String] An opaque cursor for fetching the next page.
    attr_reader :cursor
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param shifts [Array<SquareApiClient::Shift>] Shifts.
    # @param cursor [String] An opaque cursor for fetching the next page.
    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchShiftsResponse]
    def initialize(shifts: OMIT, cursor: OMIT, errors: OMIT, additional_properties: nil)
      @shifts = shifts if shifts != OMIT
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "shifts": shifts, "cursor": cursor, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchShiftsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchShiftsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      shifts = parsed_json["shifts"]&.map do | item |
  item = item.to_json
  SquareApiClient::Shift.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        shifts: shifts,
        cursor: cursor,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchShiftsResponse to a JSON object
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
      obj.shifts&.is_a?(Array) != false || raise("Passed value for field obj.shifts is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end