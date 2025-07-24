# frozen_string_literal: true
require_relative "error"
require_relative "transaction"
require "ostruct"
require "json"

module SquareApiClient
# Defines the fields that are included in the response body of
#  a request to the [ListTransactions](api-endpoint:Transactions-ListTransactions)
#  endpoint.
#  One of `errors` or `transactions` is present in a given response (never both).
  class ListTransactionsResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::Transaction>] An array of transactions that match your query.
    attr_reader :transactions
  # @return [String] A pagination cursor for retrieving the next set of results,
#  if any remain. Provide this value as the `cursor` parameter in a subsequent
#  request to this endpoint.
#  See [Paginating
#  results](https://developer.squareup.com/docs/working-with-apis/pagination) for
#  more information.
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param transactions [Array<SquareApiClient::Transaction>] An array of transactions that match your query.
    # @param cursor [String] A pagination cursor for retrieving the next set of results,
#  if any remain. Provide this value as the `cursor` parameter in a subsequent
#  request to this endpoint.
#  See [Paginating
#  results](https://developer.squareup.com/docs/working-with-apis/pagination) for
#  more information.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ListTransactionsResponse]
    def initialize(errors: OMIT, transactions: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @transactions = transactions if transactions != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "transactions": transactions, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListTransactionsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ListTransactionsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      transactions = parsed_json["transactions"]&.map do | item |
  item = item.to_json
  SquareApiClient::Transaction.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        transactions: transactions,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListTransactionsResponse to a JSON object
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
      obj.transactions&.is_a?(Array) != false || raise("Passed value for field obj.transactions is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end