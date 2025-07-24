# frozen_string_literal: true
require_relative "timecard"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# The response to a request to update a `Timecard`. The response contains
#  the updated `Timecard` object and might contain a set of `Error` objects if
#  the request resulted in errors.
  class UpdateTimecardResponse
  # @return [SquareApiClient::Timecard] The updated `Timecard`.
    attr_reader :timecard
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param timecard [SquareApiClient::Timecard] The updated `Timecard`.
    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::UpdateTimecardResponse]
    def initialize(timecard: OMIT, errors: OMIT, additional_properties: nil)
      @timecard = timecard if timecard != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "timecard": timecard, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateTimecardResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::UpdateTimecardResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["timecard"].nil?
        timecard = parsed_json["timecard"].to_json
        timecard = SquareApiClient::Timecard.from_json(json_object: timecard)
      else
        timecard = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        timecard: timecard,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateTimecardResponse to a JSON object
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
      obj.timecard.nil? || SquareApiClient::Timecard.validate_raw(obj: obj.timecard)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end