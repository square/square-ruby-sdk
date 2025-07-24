# frozen_string_literal: true
require_relative "loyalty_event_loyalty_account_filter"
require_relative "loyalty_event_type_filter"
require_relative "loyalty_event_date_time_filter"
require_relative "loyalty_event_location_filter"
require_relative "loyalty_event_order_filter"
require "ostruct"
require "json"

module square.rb
# The filtering criteria. If the request specifies multiple filters,
#  the endpoint uses a logical AND to evaluate them.
  class LoyaltyEventFilter
  # @return [square.rb::LoyaltyEventLoyaltyAccountFilter] Filter events by loyalty account.
    attr_reader :loyalty_account_filter
  # @return [square.rb::LoyaltyEventTypeFilter] Filter events by event type.
    attr_reader :type_filter
  # @return [square.rb::LoyaltyEventDateTimeFilter] Filter events by date time range.
#  For each range, the start time is inclusive and the end time
#  is exclusive.
    attr_reader :date_time_filter
  # @return [square.rb::LoyaltyEventLocationFilter] Filter events by location.
    attr_reader :location_filter
  # @return [square.rb::LoyaltyEventOrderFilter] Filter events by the order associated with the event.
    attr_reader :order_filter
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param loyalty_account_filter [square.rb::LoyaltyEventLoyaltyAccountFilter] Filter events by loyalty account.
    # @param type_filter [square.rb::LoyaltyEventTypeFilter] Filter events by event type.
    # @param date_time_filter [square.rb::LoyaltyEventDateTimeFilter] Filter events by date time range.
#  For each range, the start time is inclusive and the end time
#  is exclusive.
    # @param location_filter [square.rb::LoyaltyEventLocationFilter] Filter events by location.
    # @param order_filter [square.rb::LoyaltyEventOrderFilter] Filter events by the order associated with the event.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyEventFilter]
    def initialize(loyalty_account_filter: OMIT, type_filter: OMIT, date_time_filter: OMIT, location_filter: OMIT, order_filter: OMIT, additional_properties: nil)
      @loyalty_account_filter = loyalty_account_filter if loyalty_account_filter != OMIT
      @type_filter = type_filter if type_filter != OMIT
      @date_time_filter = date_time_filter if date_time_filter != OMIT
      @location_filter = location_filter if location_filter != OMIT
      @order_filter = order_filter if order_filter != OMIT
      @additional_properties = additional_properties
      @_field_set = { "loyalty_account_filter": loyalty_account_filter, "type_filter": type_filter, "date_time_filter": date_time_filter, "location_filter": location_filter, "order_filter": order_filter }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyEventFilter
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyEventFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["loyalty_account_filter"].nil?
        loyalty_account_filter = parsed_json["loyalty_account_filter"].to_json
        loyalty_account_filter = square.rb::LoyaltyEventLoyaltyAccountFilter.from_json(json_object: loyalty_account_filter)
      else
        loyalty_account_filter = nil
      end
      unless parsed_json["type_filter"].nil?
        type_filter = parsed_json["type_filter"].to_json
        type_filter = square.rb::LoyaltyEventTypeFilter.from_json(json_object: type_filter)
      else
        type_filter = nil
      end
      unless parsed_json["date_time_filter"].nil?
        date_time_filter = parsed_json["date_time_filter"].to_json
        date_time_filter = square.rb::LoyaltyEventDateTimeFilter.from_json(json_object: date_time_filter)
      else
        date_time_filter = nil
      end
      unless parsed_json["location_filter"].nil?
        location_filter = parsed_json["location_filter"].to_json
        location_filter = square.rb::LoyaltyEventLocationFilter.from_json(json_object: location_filter)
      else
        location_filter = nil
      end
      unless parsed_json["order_filter"].nil?
        order_filter = parsed_json["order_filter"].to_json
        order_filter = square.rb::LoyaltyEventOrderFilter.from_json(json_object: order_filter)
      else
        order_filter = nil
      end
      new(
        loyalty_account_filter: loyalty_account_filter,
        type_filter: type_filter,
        date_time_filter: date_time_filter,
        location_filter: location_filter,
        order_filter: order_filter,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyEventFilter to a JSON object
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
      obj.loyalty_account_filter.nil? || square.rb::LoyaltyEventLoyaltyAccountFilter.validate_raw(obj: obj.loyalty_account_filter)
      obj.type_filter.nil? || square.rb::LoyaltyEventTypeFilter.validate_raw(obj: obj.type_filter)
      obj.date_time_filter.nil? || square.rb::LoyaltyEventDateTimeFilter.validate_raw(obj: obj.date_time_filter)
      obj.location_filter.nil? || square.rb::LoyaltyEventLocationFilter.validate_raw(obj: obj.location_filter)
      obj.order_filter.nil? || square.rb::LoyaltyEventOrderFilter.validate_raw(obj: obj.order_filter)
    end
  end
end