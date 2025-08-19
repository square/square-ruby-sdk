# frozen_string_literal: true
require_relative "custom_attribute"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Represents a
#  mAttributes](api-endpoint:CustomerCustomAttributes-ListCustomerCustomAttributes)
#  response.
#  Either `custom_attributes`, an empty object, or `errors` is present in the
#  response. If additional
#  results are available, the `cursor` field is also present along with
#  `custom_attributes`.
  class ListCustomerCustomAttributesResponse
  # @return [Array<SquareApiClient::CustomAttribute>] The retrieved custom attributes. If `with_definitions` was set to `true` in the
#  request,
#  the custom attribute definition is returned in the `definition` field of each
#  custom attribute.
#  If no custom attributes are found, Square returns an empty object (`{}`).
    attr_reader :custom_attributes
  # @return [String] The cursor to use in your next call to this endpoint to retrieve the next page
#  of results
#  for your original request. This field is present only if the request succeeded
#  and additional
#  results are available. For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param custom_attributes [Array<SquareApiClient::CustomAttribute>] The retrieved custom attributes. If `with_definitions` was set to `true` in the
#  request,
#  the custom attribute definition is returned in the `definition` field of each
#  custom attribute.
#  If no custom attributes are found, Square returns an empty object (`{}`).
    # @param cursor [String] The cursor to use in your next call to this endpoint to retrieve the next page
#  of results
#  for your original request. This field is present only if the request succeeded
#  and additional
#  results are available. For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ListCustomerCustomAttributesResponse]
    def initialize(custom_attributes: OMIT, cursor: OMIT, errors: OMIT, additional_properties: nil)
      @custom_attributes = custom_attributes if custom_attributes != OMIT
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "custom_attributes": custom_attributes, "cursor": cursor, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListCustomerCustomAttributesResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ListCustomerCustomAttributesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      custom_attributes = parsed_json["custom_attributes"]&.map do | item |
  item = item.to_json
  SquareApiClient::CustomAttribute.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        custom_attributes: custom_attributes,
        cursor: cursor,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of ListCustomerCustomAttributesResponse to a JSON object
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
      obj.custom_attributes&.is_a?(Array) != false || raise("Passed value for field obj.custom_attributes is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end