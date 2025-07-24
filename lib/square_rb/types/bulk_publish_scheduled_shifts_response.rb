# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Represents a
#  [BulkPublishScheduledShifts](api-endpoint:Labor-BulkPublishScheduledShifts)
#  response.
#  Either `scheduled_shifts` or `errors` is present in the response.
  class BulkPublishScheduledShiftsResponse
  # @return [Hash{String => SquareApiClient::PublishScheduledShiftResponse}] A map of key-value pairs that represent responses for individual publish
#  requests.
#  The order of responses might differ from the order in which the requests were
#  provided.
#  - Each key is the scheduled shift ID that was specified for a publish request.
#  - Each value is the corresponding response. If the request succeeds, the value
#  is the
#  published scheduled shift. If the request fails, the value is an `errors` array
#  containing
#  any errors that occurred while processing the request.
    attr_reader :responses
  # @return [Array<SquareApiClient::Error>] Any top-level errors that prevented the bulk operation from succeeding.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param responses [Hash{String => SquareApiClient::PublishScheduledShiftResponse}] A map of key-value pairs that represent responses for individual publish
#  requests.
#  The order of responses might differ from the order in which the requests were
#  provided.
#  - Each key is the scheduled shift ID that was specified for a publish request.
#  - Each value is the corresponding response. If the request succeeds, the value
#  is the
#  published scheduled shift. If the request fails, the value is an `errors` array
#  containing
#  any errors that occurred while processing the request.
    # @param errors [Array<SquareApiClient::Error>] Any top-level errors that prevented the bulk operation from succeeding.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BulkPublishScheduledShiftsResponse]
    def initialize(responses: OMIT, errors: OMIT, additional_properties: nil)
      @responses = responses if responses != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "responses": responses, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BulkPublishScheduledShiftsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BulkPublishScheduledShiftsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      responses = parsed_json["responses"]&.transform_values do | value |
  value = value.to_json
  SquareApiClient::PublishScheduledShiftResponse.from_json(json_object: value)
end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        responses: responses,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of BulkPublishScheduledShiftsResponse to a JSON object
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
      obj.responses&.is_a?(Hash) != false || raise("Passed value for field obj.responses is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end