# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# A record of a team member's break on a [timecard](entity:Timecard).
  class Break
  # @return [String] The UUID for this object.
    attr_reader :id
  # @return [String] RFC 3339; follows the same timezone information as the
#  [timecard](entity:Timecard). Precision up to
#  the minute is respected; seconds are truncated.
    attr_reader :start_at
  # @return [String] RFC 3339; follows the same timezone information as the
#  [timecard](entity:Timecard). Precision up to
#  the minute is respected; seconds are truncated.
    attr_reader :end_at
  # @return [String] The [BreakType](entity:BreakType) that this break was templated on.
    attr_reader :break_type_id
  # @return [String] A human-readable name.
    attr_reader :name
  # @return [String] Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of
#  the break.
#  Example for break expected duration of 15 minutes: PT15M
    attr_reader :expected_duration
  # @return [Boolean] Whether this break counts towards time worked for compensation
#  purposes.
    attr_reader :is_paid
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID for this object.
    # @param start_at [String] RFC 3339; follows the same timezone information as the
#  [timecard](entity:Timecard). Precision up to
#  the minute is respected; seconds are truncated.
    # @param end_at [String] RFC 3339; follows the same timezone information as the
#  [timecard](entity:Timecard). Precision up to
#  the minute is respected; seconds are truncated.
    # @param break_type_id [String] The [BreakType](entity:BreakType) that this break was templated on.
    # @param name [String] A human-readable name.
    # @param expected_duration [String] Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of
#  the break.
#  Example for break expected duration of 15 minutes: PT15M
    # @param is_paid [Boolean] Whether this break counts towards time worked for compensation
#  purposes.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Break]
    def initialize(id: OMIT, start_at:, end_at: OMIT, break_type_id:, name:, expected_duration:, is_paid:, additional_properties: nil)
      @id = id if id != OMIT
      @start_at = start_at
      @end_at = end_at if end_at != OMIT
      @break_type_id = break_type_id
      @name = name
      @expected_duration = expected_duration
      @is_paid = is_paid
      @additional_properties = additional_properties
      @_field_set = { "id": id, "start_at": start_at, "end_at": end_at, "break_type_id": break_type_id, "name": name, "expected_duration": expected_duration, "is_paid": is_paid }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Break
    #
    # @param json_object [String] 
    # @return [square.rb::Break]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      start_at = parsed_json["start_at"]
      end_at = parsed_json["end_at"]
      break_type_id = parsed_json["break_type_id"]
      name = parsed_json["name"]
      expected_duration = parsed_json["expected_duration"]
      is_paid = parsed_json["is_paid"]
      new(
        id: id,
        start_at: start_at,
        end_at: end_at,
        break_type_id: break_type_id,
        name: name,
        expected_duration: expected_duration,
        is_paid: is_paid,
        additional_properties: struct
      )
    end
# Serialize an instance of Break to a JSON object
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
      obj.start_at.is_a?(String) != false || raise("Passed value for field obj.start_at is not the expected type, validation failed.")
      obj.end_at&.is_a?(String) != false || raise("Passed value for field obj.end_at is not the expected type, validation failed.")
      obj.break_type_id.is_a?(String) != false || raise("Passed value for field obj.break_type_id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.expected_duration.is_a?(String) != false || raise("Passed value for field obj.expected_duration is not the expected type, validation failed.")
      obj.is_paid.is_a?(Boolean) != false || raise("Passed value for field obj.is_paid is not the expected type, validation failed.")
    end
  end
end