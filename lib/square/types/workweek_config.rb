# frozen_string_literal: true
require_relative "weekday"
require "ostruct"
require "json"

module square.rb
# Sets the day of the week and hour of the day that a business starts a
#  workweek. This is used to calculate overtime pay.
  class WorkweekConfig
  # @return [String] The UUID for this object.
    attr_reader :id
  # @return [square.rb::Weekday] The day of the week on which a business week starts for
#  compensation purposes.
#  See [Weekday](#type-weekday) for possible values
    attr_reader :start_of_week
  # @return [String] The local time at which a business week starts. Represented as a
#  string in `HH:MM` format (`HH:MM:SS` is also accepted, but seconds are
#  truncated).
    attr_reader :start_of_day_local_time
  # @return [Integer] Used for resolving concurrency issues. The request fails if the version
#  provided does not match the server version at the time of the request. If not
#  provided,
#  Square executes a blind write; potentially overwriting data from another
#  write.
    attr_reader :version
  # @return [String] A read-only timestamp in RFC 3339 format; presented in UTC.
    attr_reader :created_at
  # @return [String] A read-only timestamp in RFC 3339 format; presented in UTC.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID for this object.
    # @param start_of_week [square.rb::Weekday] The day of the week on which a business week starts for
#  compensation purposes.
#  See [Weekday](#type-weekday) for possible values
    # @param start_of_day_local_time [String] The local time at which a business week starts. Represented as a
#  string in `HH:MM` format (`HH:MM:SS` is also accepted, but seconds are
#  truncated).
    # @param version [Integer] Used for resolving concurrency issues. The request fails if the version
#  provided does not match the server version at the time of the request. If not
#  provided,
#  Square executes a blind write; potentially overwriting data from another
#  write.
    # @param created_at [String] A read-only timestamp in RFC 3339 format; presented in UTC.
    # @param updated_at [String] A read-only timestamp in RFC 3339 format; presented in UTC.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::WorkweekConfig]
    def initialize(id: OMIT, start_of_week:, start_of_day_local_time:, version: OMIT, created_at: OMIT, updated_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @start_of_week = start_of_week
      @start_of_day_local_time = start_of_day_local_time
      @version = version if version != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "start_of_week": start_of_week, "start_of_day_local_time": start_of_day_local_time, "version": version, "created_at": created_at, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkweekConfig
    #
    # @param json_object [String] 
    # @return [square.rb::WorkweekConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      start_of_week = parsed_json["start_of_week"]
      start_of_day_local_time = parsed_json["start_of_day_local_time"]
      version = parsed_json["version"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      new(
        id: id,
        start_of_week: start_of_week,
        start_of_day_local_time: start_of_day_local_time,
        version: version,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkweekConfig to a JSON object
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
      obj.start_of_week.is_a?(square.rb::Weekday) != false || raise("Passed value for field obj.start_of_week is not the expected type, validation failed.")
      obj.start_of_day_local_time.is_a?(String) != false || raise("Passed value for field obj.start_of_day_local_time is not the expected type, validation failed.")
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end