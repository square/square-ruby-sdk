# frozen_string_literal: true
require_relative "error"
require_relative "payment_link"
require "ostruct"
require "json"

module SquareApiClient
  class ListPaymentLinksResponse
  # @return [Array<SquareApiClient::Error>] Errors that occurred during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::PaymentLink>] The list of payment links.
    attr_reader :payment_links
  # @return [String] When a response is truncated, it includes a cursor that you can use in a
#  subsequent request
#  to retrieve the next set of gift cards. If a cursor is not present, this is the
#  final response.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Errors that occurred during the request.
    # @param payment_links [Array<SquareApiClient::PaymentLink>] The list of payment links.
    # @param cursor [String] When a response is truncated, it includes a cursor that you can use in a
#  subsequent request
#  to retrieve the next set of gift cards. If a cursor is not present, this is the
#  final response.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ListPaymentLinksResponse]
    def initialize(errors: OMIT, payment_links: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @payment_links = payment_links if payment_links != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "payment_links": payment_links, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListPaymentLinksResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ListPaymentLinksResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      payment_links = parsed_json["payment_links"]&.map do | item |
  item = item.to_json
  SquareApiClient::PaymentLink.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        payment_links: payment_links,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListPaymentLinksResponse to a JSON object
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
      obj.payment_links&.is_a?(Array) != false || raise("Passed value for field obj.payment_links is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end