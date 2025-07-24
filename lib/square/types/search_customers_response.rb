# frozen_string_literal: true
require_relative "error"
require_relative "customer"
require "ostruct"
require "json"

module square.rb
# Defines the fields that are included in the response body of
#  a request to the `SearchCustomers` endpoint.
#  Either `errors` or `customers` is present in a given response (never both).
  class SearchCustomersResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<square.rb::Customer>] The customer profiles that match the search query. If any search condition is
#  not met, the result is an empty object (`{}`).
#  Only customer profiles with public information (`given_name`, `family_name`,
#  `company_name`, `email_address`, or `phone_number`)
#  are included in the response.
    attr_reader :customers
  # @return [String] A pagination cursor that can be used during subsequent calls
#  to `SearchCustomers` to retrieve the next set of results associated
#  with the original query. Pagination cursors are only present when
#  a request succeeds and additional results are available.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [Long] The total count of customers associated with the Square account that match the
#  search query. Only customer profiles with
#  public information (`given_name`, `family_name`, `company_name`,
#  `email_address`, or `phone_number`) are counted. This field is
#  present only if `count` is set to `true` in the request.
    attr_reader :count
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param customers [Array<square.rb::Customer>] The customer profiles that match the search query. If any search condition is
#  not met, the result is an empty object (`{}`).
#  Only customer profiles with public information (`given_name`, `family_name`,
#  `company_name`, `email_address`, or `phone_number`)
#  are included in the response.
    # @param cursor [String] A pagination cursor that can be used during subsequent calls
#  to `SearchCustomers` to retrieve the next set of results associated
#  with the original query. Pagination cursors are only present when
#  a request succeeds and additional results are available.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param count [Long] The total count of customers associated with the Square account that match the
#  search query. Only customer profiles with
#  public information (`given_name`, `family_name`, `company_name`,
#  `email_address`, or `phone_number`) are counted. This field is
#  present only if `count` is set to `true` in the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchCustomersResponse]
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
# Deserialize a JSON object to an instance of SearchCustomersResponse
    #
    # @param json_object [String] 
    # @return [square.rb::SearchCustomersResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      customers = parsed_json["customers"]&.map do | item |
  item = item.to_json
  square.rb::Customer.from_json(json_object: item)
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
# Serialize an instance of SearchCustomersResponse to a JSON object
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