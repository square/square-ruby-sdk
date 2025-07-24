# frozen_string_literal: true
require_relative "order_entry"
require_relative "order"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Either the `order_entries` or `orders` field is set, depending on whether
#  `return_entries` is set on the
#  [SearchOrdersRequest](api-endpoint:Orders-SearchOrders).
  class SearchOrdersResponse
  # @return [Array<SquareApiClient::OrderEntry>] A list of [OrderEntries](entity:OrderEntry) that fit the query
#  conditions. The list is populated only if `return_entries` is set to `true` in
#  the request.
    attr_reader :order_entries
  # @return [Array<SquareApiClient::Order>] A list of
#  [Order](entity:Order) objects that match the query conditions. The list is
#  populated only if
#  `return_entries` is set to `false` in the request.
    attr_reader :orders
  # @return [String] The pagination cursor to be used in a subsequent request. If unset,
#  this is the final response.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [Array<SquareApiClient::Error>] [Errors](entity:Error) encountered during the search.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param order_entries [Array<SquareApiClient::OrderEntry>] A list of [OrderEntries](entity:OrderEntry) that fit the query
#  conditions. The list is populated only if `return_entries` is set to `true` in
#  the request.
    # @param orders [Array<SquareApiClient::Order>] A list of
#  [Order](entity:Order) objects that match the query conditions. The list is
#  populated only if
#  `return_entries` is set to `false` in the request.
    # @param cursor [String] The pagination cursor to be used in a subsequent request. If unset,
#  this is the final response.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param errors [Array<SquareApiClient::Error>] [Errors](entity:Error) encountered during the search.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchOrdersResponse]
    def initialize(order_entries: OMIT, orders: OMIT, cursor: OMIT, errors: OMIT, additional_properties: nil)
      @order_entries = order_entries if order_entries != OMIT
      @orders = orders if orders != OMIT
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "order_entries": order_entries, "orders": orders, "cursor": cursor, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchOrdersResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchOrdersResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      order_entries = parsed_json["order_entries"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderEntry.from_json(json_object: item)
end
      orders = parsed_json["orders"]&.map do | item |
  item = item.to_json
  SquareApiClient::Order.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        order_entries: order_entries,
        orders: orders,
        cursor: cursor,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchOrdersResponse to a JSON object
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
      obj.order_entries&.is_a?(Array) != false || raise("Passed value for field obj.order_entries is not the expected type, validation failed.")
      obj.orders&.is_a?(Array) != false || raise("Passed value for field obj.orders is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end