# frozen_string_literal: true
require_relative "error"
require_relative "customer"
require "ostruct"
require "json"

module SquareApiClient
# Defines the fields that are included in the response body of
#  a request to the `ListCustomers` endpoint.
#  Either `errors` or `customers` is present in a given response (never both).
  class ListCustomersResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::Customer>] The customer profiles associated with the Square account or an empty object
#  (`{}`) if none are found.
#  Only customer profiles with public information (`given_name`, `family_name`,
#  `company_name`, `email_address`, or
#  `phone_number`) are included in the response.
    attr_reader :customers
  # @return [String] A pagination cursor to retrieve the next set of results for the
#  original query. A cursor is only present if the request succeeded and additional
#  results
#  are available.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [Long] The total count of customers associated with the Square account. Only customer
#  profiles with public information
#  (`given_name`, `family_name`, `company_name`, `email_address`, or
#  `phone_number`) are counted. This field is present
#  only if `count` is set to `true` in the request.
    attr_reader :count
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param customers [Array<SquareApiClient::Customer>] The customer profiles associated with the Square account or an empty object
#  (`{}`) if none are found.
#  Only customer profiles with public information (`given_name`, `family_name`,
#  `company_name`, `email_address`, or
#  `phone_number`) are included in the response.
    # @param cursor [String] A pagination cursor to retrieve the next set of results for the
#  original query. A cursor is only present if the request succeeded and additional
#  results
#  are available.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param count [Long] The total count of customers associated with the Square account. Only customer
#  profiles with public information
#  (`given_name`, `family_name`, `company_name`, `email_address`, or
#  `phone_number`) are counted. This field is present
#  only if `count` is set to `true` in the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ListCustomersResponse]
    def initialize(errors: OMIT, customers: OMIT, cursor: OMIT, count: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @customers = customers if customers != OMIT
      @cursor = cursor if cursor != OMIT
      @count = count if count != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "customers": customers, "cursor": cursor, "count": count }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListCustomersResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ListCustomersResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      customers = parsed_json["customers"]&.map do | item |
  item = item.to_json
  SquareApiClient::Customer.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      count = parsed_json["count"]
      new(
        errors: errors,
        customers: customers,
        cursor: cursor,
        count: count,
        additional_properties: struct
      )
    end
# Serialize an instance of ListCustomersResponse to a JSON object
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
      obj.customers&.is_a?(Array) != false || raise("Passed value for field obj.customers is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.count&.is_a?(Long) != false || raise("Passed value for field obj.count is not the expected type, validation failed.")
    end
  end
end