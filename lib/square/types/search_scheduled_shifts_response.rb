# frozen_string_literal: true
require_relative "scheduled_shift"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Represents a [SearchScheduledShifts](api-endpoint:Labor-SearchScheduledShifts)
#  response.
#  Either `scheduled_shifts` or `errors` is present in the response.
  class SearchScheduledShiftsResponse
  # @return [Array<square.rb::ScheduledShift>] A paginated list of scheduled shifts that match the query conditions.
    attr_reader :scheduled_shifts
  # @return [String] The pagination cursor used to retrieve the next page of results. This field is
#  present
#  only if additional results are available.
    attr_reader :cursor
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param scheduled_shifts [Array<square.rb::ScheduledShift>] A paginated list of scheduled shifts that match the query conditions.
    # @param cursor [String] The pagination cursor used to retrieve the next page of results. This field is
#  present
#  only if additional results are available.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchScheduledShiftsResponse]
    def initialize(scheduled_shifts: OMIT, cursor: OMIT, errors: OMIT, additional_properties: nil)
      @scheduled_shifts = scheduled_shifts if scheduled_shifts != OMIT
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "scheduled_shifts": scheduled_shifts, "cursor": cursor, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchScheduledShiftsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::SearchScheduledShiftsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      scheduled_shifts = parsed_json["scheduled_shifts"]&.map do | item |
  item = item.to_json
  square.rb::ScheduledShift.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        scheduled_shifts: scheduled_shifts,
        cursor: cursor,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchScheduledShiftsResponse to a JSON object
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
      obj.scheduled_shifts&.is_a?(Array) != false || raise("Passed value for field obj.scheduled_shifts is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end