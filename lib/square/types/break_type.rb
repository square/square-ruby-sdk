# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# A template for a type of [break](entity:Break) that can be added to a
#  [timecard](entity:Timecard), including the expected duration and paid status.
  class BreakType
  # @return [String] The UUID for this object.
    attr_reader :id
  # @return [String] The ID of the business location this type of break applies to.
    attr_reader :location_id
  # @return [String] A human-readable name for this type of break. The name is displayed to
#  team members in Square products.
    attr_reader :break_name
  # @return [String] Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of
#  this break. Precision less than minutes is truncated.
#  Example for break expected duration of 15 minutes: PT15M
    attr_reader :expected_duration
  # @return [Boolean] Whether this break counts towards time worked for compensation
#  purposes.
    attr_reader :is_paid
  # @return [Integer] Used for resolving concurrency issues. The request fails if the version
#  provided does not match the server version at the time of the request. If a
#  value is not
#  provided, Square's servers execute a "blind" write; potentially
#  overwriting another writer's data.
    attr_reader :version
  # @return [String] A read-only timestamp in RFC 3339 format.
    attr_reader :created_at
  # @return [String] A read-only timestamp in RFC 3339 format.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID for this object.
    # @param location_id [String] The ID of the business location this type of break applies to.
    # @param break_name [String] A human-readable name for this type of break. The name is displayed to
#  team members in Square products.
    # @param expected_duration [String] Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of
#  this break. Precision less than minutes is truncated.
#  Example for break expected duration of 15 minutes: PT15M
    # @param is_paid [Boolean] Whether this break counts towards time worked for compensation
#  purposes.
    # @param version [Integer] Used for resolving concurrency issues. The request fails if the version
#  provided does not match the server version at the time of the request. If a
#  value is not
#  provided, Square's servers execute a "blind" write; potentially
#  overwriting another writer's data.
    # @param created_at [String] A read-only timestamp in RFC 3339 format.
    # @param updated_at [String] A read-only timestamp in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BreakType]
    def initialize(id: OMIT, location_id:, break_name:, expected_duration:, is_paid:, version: OMIT, created_at: OMIT, updated_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @location_id = location_id
      @break_name = break_name
      @expected_duration = expected_duration
      @is_paid = is_paid
      @version = version if version != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "location_id": location_id, "break_name": break_name, "expected_duration": expected_duration, "is_paid": is_paid, "version": version, "created_at": created_at, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BreakType
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BreakType]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      location_id = parsed_json["location_id"]
      break_name = parsed_json["break_name"]
      expected_duration = parsed_json["expected_duration"]
      is_paid = parsed_json["is_paid"]
      version = parsed_json["version"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      new(
        id: id,
        location_id: location_id,
        break_name: break_name,
        expected_duration: expected_duration,
        is_paid: is_paid,
        version: version,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of BreakType to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.location_id.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.break_name.is_a?(String) != false || raise("Passed value for field obj.break_name is not the expected type, validation failed.")
      obj.expected_duration.is_a?(String) != false || raise("Passed value for field obj.expected_duration is not the expected type, validation failed.")
      obj.is_paid.is_a?(Boolean) != false || raise("Passed value for field obj.is_paid is not the expected type, validation failed.")
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end