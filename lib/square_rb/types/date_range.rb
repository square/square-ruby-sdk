# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# A range defined by two dates. Used for filtering a query for Connect v2
#  objects that have date properties.
  class DateRange
  # @return [String] A string in `YYYY-MM-DD` format, such as `2017-10-31`, per the ISO 8601
#  extended format for calendar dates.
#  The beginning of a date range (inclusive).
    attr_reader :start_date
  # @return [String] A string in `YYYY-MM-DD` format, such as `2017-10-31`, per the ISO 8601
#  extended format for calendar dates.
#  The end of a date range (inclusive).
    attr_reader :end_date
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param start_date [String] A string in `YYYY-MM-DD` format, such as `2017-10-31`, per the ISO 8601
#  extended format for calendar dates.
#  The beginning of a date range (inclusive).
    # @param end_date [String] A string in `YYYY-MM-DD` format, such as `2017-10-31`, per the ISO 8601
#  extended format for calendar dates.
#  The end of a date range (inclusive).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DateRange]
    def initialize(start_date: OMIT, end_date: OMIT, additional_properties: nil)
      @start_date = start_date if start_date != OMIT
      @end_date = end_date if end_date != OMIT
      @additional_properties = additional_properties
      @_field_set = { "start_date": start_date, "end_date": end_date }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DateRange
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DateRange]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      start_date = parsed_json["start_date"]
      end_date = parsed_json["end_date"]
      new(
        start_date: start_date,
        end_date: end_date,
        additional_properties: struct
      )
    end
# Serialize an instance of DateRange to a JSON object
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
      obj.start_date&.is_a?(String) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
      obj.end_date&.is_a?(String) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
    end
  end
end