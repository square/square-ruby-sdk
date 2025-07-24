# frozen_string_literal: true
require_relative "error"
require_relative "cash_drawer_shift_event"
require "ostruct"
require "json"

module square.rb
  class ListCashDrawerShiftEventsResponse
  # @return [String] Opaque cursor for fetching the next page. Cursor is not present in
#  the last page of results.
    attr_reader :cursor
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<square.rb::CashDrawerShiftEvent>] All of the events (payments, refunds, etc.) for a cash drawer during
#  the shift.
    attr_reader :cash_drawer_shift_events
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param cursor [String] Opaque cursor for fetching the next page. Cursor is not present in
#  the last page of results.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param cash_drawer_shift_events [Array<square.rb::CashDrawerShiftEvent>] All of the events (payments, refunds, etc.) for a cash drawer during
#  the shift.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ListCashDrawerShiftEventsResponse]
    def initialize(cursor: OMIT, errors: OMIT, cash_drawer_shift_events: OMIT, additional_properties: nil)
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @cash_drawer_shift_events = cash_drawer_shift_events if cash_drawer_shift_events != OMIT
      @additional_properties = additional_properties
      @_field_set = { "cursor": cursor, "errors": errors, "cash_drawer_shift_events": cash_drawer_shift_events }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListCashDrawerShiftEventsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::ListCashDrawerShiftEventsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      cash_drawer_shift_events = parsed_json["cash_drawer_shift_events"]&.map do | item |
  item = item.to_json
  square.rb::CashDrawerShiftEvent.from_json(json_object: item)
end
      new(
        cursor: cursor,
        errors: errors,
        cash_drawer_shift_events: cash_drawer_shift_events,
        additional_properties: struct
      )
    end
# Serialize an instance of ListCashDrawerShiftEventsResponse to a JSON object
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
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.cash_drawer_shift_events&.is_a?(Array) != false || raise("Passed value for field obj.cash_drawer_shift_events is not the expected type, validation failed.")
    end
  end
end