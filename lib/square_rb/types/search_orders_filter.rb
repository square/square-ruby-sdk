# frozen_string_literal: true
require_relative "search_orders_state_filter"
require_relative "search_orders_date_time_filter"
require_relative "search_orders_fulfillment_filter"
require_relative "search_orders_source_filter"
require_relative "search_orders_customer_filter"
require "ostruct"
require "json"

module SquareApiClient
# Filtering criteria to use for a `SearchOrders` request. Multiple filters
#  are ANDed together.
  class SearchOrdersFilter
  # @return [SquareApiClient::SearchOrdersStateFilter] Filter by [OrderState](entity:OrderState).
    attr_reader :state_filter
  # @return [SquareApiClient::SearchOrdersDateTimeFilter] Filter for results within a time range.
#  __Important:__ If you filter for orders by time range, you must set
#  `SearchOrdersSort`
#  to sort by the same field.
#  [Learn more about filtering orders by time
#  manage-orders/search-orders#important-note-about-filtering-orders-by-time-range)
    attr_reader :date_time_filter
  # @return [SquareApiClient::SearchOrdersFulfillmentFilter] Filter by the fulfillment type or state.
    attr_reader :fulfillment_filter
  # @return [SquareApiClient::SearchOrdersSourceFilter] Filter by the source of the order.
    attr_reader :source_filter
  # @return [SquareApiClient::SearchOrdersCustomerFilter] Filter by customers associated with the order.
    attr_reader :customer_filter
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param state_filter [SquareApiClient::SearchOrdersStateFilter] Filter by [OrderState](entity:OrderState).
    # @param date_time_filter [SquareApiClient::SearchOrdersDateTimeFilter] Filter for results within a time range.
#  __Important:__ If you filter for orders by time range, you must set
#  `SearchOrdersSort`
#  to sort by the same field.
#  [Learn more about filtering orders by time
#  manage-orders/search-orders#important-note-about-filtering-orders-by-time-range)
    # @param fulfillment_filter [SquareApiClient::SearchOrdersFulfillmentFilter] Filter by the fulfillment type or state.
    # @param source_filter [SquareApiClient::SearchOrdersSourceFilter] Filter by the source of the order.
    # @param customer_filter [SquareApiClient::SearchOrdersCustomerFilter] Filter by customers associated with the order.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SearchOrdersFilter]
    def initialize(state_filter: OMIT, date_time_filter: OMIT, fulfillment_filter: OMIT, source_filter: OMIT, customer_filter: OMIT, additional_properties: nil)
      @state_filter = state_filter if state_filter != OMIT
      @date_time_filter = date_time_filter if date_time_filter != OMIT
      @fulfillment_filter = fulfillment_filter if fulfillment_filter != OMIT
      @source_filter = source_filter if source_filter != OMIT
      @customer_filter = customer_filter if customer_filter != OMIT
      @additional_properties = additional_properties
      @_field_set = { "state_filter": state_filter, "date_time_filter": date_time_filter, "fulfillment_filter": fulfillment_filter, "source_filter": source_filter, "customer_filter": customer_filter }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchOrdersFilter
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SearchOrdersFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["state_filter"].nil?
        state_filter = parsed_json["state_filter"].to_json
        state_filter = SquareApiClient::SearchOrdersStateFilter.from_json(json_object: state_filter)
      else
        state_filter = nil
      end
      unless parsed_json["date_time_filter"].nil?
        date_time_filter = parsed_json["date_time_filter"].to_json
        date_time_filter = SquareApiClient::SearchOrdersDateTimeFilter.from_json(json_object: date_time_filter)
      else
        date_time_filter = nil
      end
      unless parsed_json["fulfillment_filter"].nil?
        fulfillment_filter = parsed_json["fulfillment_filter"].to_json
        fulfillment_filter = SquareApiClient::SearchOrdersFulfillmentFilter.from_json(json_object: fulfillment_filter)
      else
        fulfillment_filter = nil
      end
      unless parsed_json["source_filter"].nil?
        source_filter = parsed_json["source_filter"].to_json
        source_filter = SquareApiClient::SearchOrdersSourceFilter.from_json(json_object: source_filter)
      else
        source_filter = nil
      end
      unless parsed_json["customer_filter"].nil?
        customer_filter = parsed_json["customer_filter"].to_json
        customer_filter = SquareApiClient::SearchOrdersCustomerFilter.from_json(json_object: customer_filter)
      else
        customer_filter = nil
      end
      new(
        state_filter: state_filter,
        date_time_filter: date_time_filter,
        fulfillment_filter: fulfillment_filter,
        source_filter: source_filter,
        customer_filter: customer_filter,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchOrdersFilter to a JSON object
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
      obj.state_filter.nil? || SquareApiClient::SearchOrdersStateFilter.validate_raw(obj: obj.state_filter)
      obj.date_time_filter.nil? || SquareApiClient::SearchOrdersDateTimeFilter.validate_raw(obj: obj.date_time_filter)
      obj.fulfillment_filter.nil? || SquareApiClient::SearchOrdersFulfillmentFilter.validate_raw(obj: obj.fulfillment_filter)
      obj.source_filter.nil? || SquareApiClient::SearchOrdersSourceFilter.validate_raw(obj: obj.source_filter)
      obj.customer_filter.nil? || SquareApiClient::SearchOrdersCustomerFilter.validate_raw(obj: obj.customer_filter)
    end
  end
end