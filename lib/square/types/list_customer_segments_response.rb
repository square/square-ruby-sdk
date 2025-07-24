# frozen_string_literal: true
require_relative "error"
require_relative "customer_segment"
require "ostruct"
require "json"

module SquareApiClient
# Defines the fields that are included in the response body for requests to the
#  `ListCustomerSegments` endpoint.
#  Either `errors` or `segments` is present in a given response (never both).
  class ListCustomerSegmentsResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::CustomerSegment>] The list of customer segments belonging to the associated Square account.
    attr_reader :segments
  # @return [String] A pagination cursor to be used in subsequent calls to `ListCustomerSegments`
#  to retrieve the next set of query results. The cursor is only present if the
#  request succeeded and
#  additional results are available.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param segments [Array<SquareApiClient::CustomerSegment>] The list of customer segments belonging to the associated Square account.
    # @param cursor [String] A pagination cursor to be used in subsequent calls to `ListCustomerSegments`
#  to retrieve the next set of query results. The cursor is only present if the
#  request succeeded and
#  additional results are available.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ListCustomerSegmentsResponse]
    def initialize(errors: OMIT, segments: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @segments = segments if segments != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "segments": segments, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListCustomerSegmentsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ListCustomerSegmentsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      segments = parsed_json["segments"]&.map do | item |
  item = item.to_json
  SquareApiClient::CustomerSegment.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        segments: segments,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListCustomerSegmentsResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.segments&.is_a?(Array) != false || raise("Passed value for field obj.segments is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end