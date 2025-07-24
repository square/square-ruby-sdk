# frozen_string_literal: true
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Defines the fields included in the response body from the
#  [BulkCreateCustomers](api-endpoint:Customers-BulkCreateCustomers) endpoint.
  class BulkCreateCustomersResponse
  # @return [Hash{String => SquareApiClient::CreateCustomerResponse}] A map of responses that correspond to individual create requests, represented by
#  key-value pairs.
#  Each key is the idempotency key that was provided for a create request and each
#  value
#  is the corresponding response.
#  If the request succeeds, the value is the new customer profile.
#  If the request fails, the value contains any errors that occurred during the
#  request.
    attr_reader :responses
  # @return [Array<SquareApiClient::Error>] Any top-level errors that prevented the bulk operation from running.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param responses [Hash{String => SquareApiClient::CreateCustomerResponse}] A map of responses that correspond to individual create requests, represented by
#  key-value pairs.
#  Each key is the idempotency key that was provided for a create request and each
#  value
#  is the corresponding response.
#  If the request succeeds, the value is the new customer profile.
#  If the request fails, the value contains any errors that occurred during the
#  request.
    # @param errors [Array<SquareApiClient::Error>] Any top-level errors that prevented the bulk operation from running.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BulkCreateCustomersResponse]
    def initialize(responses: OMIT, errors: OMIT, additional_properties: nil)
      @responses = responses if responses != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "responses": responses, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BulkCreateCustomersResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BulkCreateCustomersResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      responses = parsed_json["responses"]&.transform_values do | value |
  value = value.to_json
  SquareApiClient::CreateCustomerResponse.from_json(json_object: value)
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
# Serialize an instance of BulkCreateCustomersResponse to a JSON object
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