# frozen_string_literal: true
require_relative "error"
require_relative "payment"
require "ostruct"
require "json"

module SquareApiClient
# Defines the response returned by
#  [ListPayments](api-endpoint:Payments-ListPayments).
  class ListPaymentsResponse
  # @return [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::Payment>] The requested list of payments.
    attr_reader :payments
  # @return [String] The pagination cursor to be used in a subsequent request. If empty,
#  this is the final response.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    # @param payments [Array<SquareApiClient::Payment>] The requested list of payments.
    # @param cursor [String] The pagination cursor to be used in a subsequent request. If empty,
#  this is the final response.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ListPaymentsResponse]
    def initialize(errors: OMIT, payments: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @payments = payments if payments != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "payments": payments, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListPaymentsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ListPaymentsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      payments = parsed_json["payments"]&.map do | item |
  item = item.to_json
  SquareApiClient::Payment.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        payments: payments,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListPaymentsResponse to a JSON object
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
      obj.payments&.is_a?(Array) != false || raise("Passed value for field obj.payments is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end