# frozen_string_literal: true
require_relative "error"
require_relative "customer_segment"
require "ostruct"
require "json"

module SquareApiClient
# Defines the fields that are included in the response body for requests to the
#  `RetrieveCustomerSegment` endpoint.
#  Either `errors` or `segment` is present in a given response (never both).
  class GetCustomerSegmentResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [SquareApiClient::CustomerSegment] The retrieved customer segment.
    attr_reader :segment
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param segment [SquareApiClient::CustomerSegment] The retrieved customer segment.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GetCustomerSegmentResponse]
    def initialize(errors: OMIT, segment: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @segment = segment if segment != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "segment": segment }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetCustomerSegmentResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GetCustomerSegmentResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      unless parsed_json["segment"].nil?
        segment = parsed_json["segment"].to_json
        segment = SquareApiClient::CustomerSegment.from_json(json_object: segment)
      else
        segment = nil
      end
      new(
        errors: errors,
        segment: segment,
        additional_properties: struct
      )
    end
# Serialize an instance of GetCustomerSegmentResponse to a JSON object
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
      obj.segment.nil? || SquareApiClient::CustomerSegment.validate_raw(obj: obj.segment)
    end
  end
end