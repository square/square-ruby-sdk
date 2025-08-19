# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents a generic time range. The start and end values are
#  represented in RFC 3339 format. Time ranges are customized to be
#  inclusive or exclusive based on the needs of a particular endpoint.
#  Refer to the relevant endpoint-specific documentation to determine
#  how time ranges are handled.
  class TimeRange
  # @return [String] A datetime value in RFC 3339 format indicating when the time range
#  starts.
    attr_reader :start_at
  # @return [String] A datetime value in RFC 3339 format indicating when the time range
#  ends.
    attr_reader :end_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param start_at [String] A datetime value in RFC 3339 format indicating when the time range
#  starts.
    # @param end_at [String] A datetime value in RFC 3339 format indicating when the time range
#  ends.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TimeRange]
    def initialize(start_at: OMIT, end_at: OMIT, additional_properties: nil)
      @start_at = start_at if start_at != OMIT
      @end_at = end_at if end_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "start_at": start_at, "end_at": end_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TimeRange
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TimeRange]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      start_at = parsed_json["start_at"]
      end_at = parsed_json["end_at"]
      new(
        start_at: start_at,
        end_at: end_at,
        additional_properties: struct
      )
    end
# Serialize an instance of TimeRange to a JSON object
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
      obj.start_at&.is_a?(String) != false || raise("Passed value for field obj.start_at is not the expected type, validation failed.")
      obj.end_at&.is_a?(String) != false || raise("Passed value for field obj.end_at is not the expected type, validation failed.")
    end
  end
end