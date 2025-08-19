# frozen_string_literal: true
require_relative "error"
require_relative "customer_group"
require "ostruct"
require "json"

module SquareApiClient
# Defines the fields that are included in the response body of
#  a request to the
#  [ListCustomerGroups](api-endpoint:CustomerGroups-ListCustomerGroups) endpoint.
#  Either `errors` or `groups` is present in a given response (never both).
  class ListCustomerGroupsResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::CustomerGroup>] A list of customer groups belonging to the current seller.
    attr_reader :groups
  # @return [String] A pagination cursor to retrieve the next set of results for your
#  original query to the endpoint. This value is present only if the request
#  succeeded and additional results are available.
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
    # @param groups [Array<SquareApiClient::CustomerGroup>] A list of customer groups belonging to the current seller.
    # @param cursor [String] A pagination cursor to retrieve the next set of results for your
#  original query to the endpoint. This value is present only if the request
#  succeeded and additional results are available.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ListCustomerGroupsResponse]
    def initialize(errors: OMIT, groups: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @groups = groups if groups != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "groups": groups, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListCustomerGroupsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ListCustomerGroupsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      groups = parsed_json["groups"]&.map do | item |
  item = item.to_json
  SquareApiClient::CustomerGroup.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        groups: groups,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListCustomerGroupsResponse to a JSON object
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
      obj.groups&.is_a?(Array) != false || raise("Passed value for field obj.groups is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end