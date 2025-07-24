# frozen_string_literal: true
require_relative "timecard"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# The response to a request for `Timecard` objects. The response contains
#  the requested `Timecard` objects and might contain a set of `Error` objects if
#  the request resulted in errors.
  class SearchTimecardsResponse
  # @return [Array<SquareApiClient::Timecard>] Timecards.
    attr_reader :timecards
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

    # @param timecards [Array<SquareApiClient::Timecard>] Timecards.
    # @param cursor [String] An opaque cursor for fetching the next page.
    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchTimecardsResponse]
    def initialize(timecards: OMIT, cursor: OMIT, errors: OMIT, additional_properties: nil)
      @timecards = timecards if timecards != OMIT
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "timecards": timecards, "cursor": cursor, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchTimecardsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchTimecardsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      timecards = parsed_json["timecards"]&.map do | item |
  item = item.to_json
  SquareApiClient::Timecard.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        timecards: timecards,
        cursor: cursor,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchTimecardsResponse to a JSON object
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
      obj.timecards&.is_a?(Array) != false || raise("Passed value for field obj.timecards is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end