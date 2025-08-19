# frozen_string_literal: true
require_relative "invoice"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Describes a `SearchInvoices` response.
  class SearchInvoicesResponse
  # @return [Array<SquareApiClient::Invoice>] The list of invoices returned by the search.
    attr_reader :invoices
  # @return [String] When a response is truncated, it includes a cursor that you can use in a
#  subsequent request to fetch the next set of invoices. If empty, this is the
#  final
#  response.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param invoices [Array<SquareApiClient::Invoice>] The list of invoices returned by the search.
    # @param cursor [String] When a response is truncated, it includes a cursor that you can use in a
#  subsequent request to fetch the next set of invoices. If empty, this is the
#  final
#  response.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param errors [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchInvoicesResponse]
    def initialize(invoices: OMIT, cursor: OMIT, errors: OMIT, additional_properties: nil)
      @invoices = invoices if invoices != OMIT
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "invoices": invoices, "cursor": cursor, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchInvoicesResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchInvoicesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      invoices = parsed_json["invoices"]&.map do | item |
  item = item.to_json
  SquareApiClient::Invoice.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        invoices: invoices,
        cursor: cursor,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchInvoicesResponse to a JSON object
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
      obj.invoices&.is_a?(Array) != false || raise("Passed value for field obj.invoices is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end