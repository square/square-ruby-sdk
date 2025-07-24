# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents scheduling information that determines when purchases can qualify to
#  earn points
#  from a [loyalty promotion](entity:LoyaltyPromotion).
  class LoyaltyPromotionAvailableTimeData
  # @return [String] The date that the promotion starts, in `YYYY-MM-DD` format. Square populates
#  this field
#  based on the provided `time_periods`.
    attr_reader :start_date
  # @return [String] The date that the promotion ends, in `YYYY-MM-DD` format. Square populates this
#  field
#  based on the provided `time_periods`. If an end date is not specified, an
#  `ACTIVE` promotion
#  remains available until it is canceled.
    attr_reader :end_date
  # @return [Array<String>] A list of [iCalendar (RFC 5545)
#  events](https://tools.ietf.org/html/rfc5545#section-3.6.1)
#  (`VEVENT`). Each event represents an available time period per day or days of
#  the week.
#  A day can have a maximum of one available time period.
#  Only `DTSTART`, `DURATION`, and `RRULE` are supported. `DTSTART` and `DURATION`
#  are required and
#  timestamps must be in local (unzoned) time format. Include `RRULE` to specify
#  recurring promotions,
#  an end date (using the `UNTIL` keyword), or both. For more information, see
#  [Available
#  ps://developer.squareup.com/docs/loyalty-api/loyalty-promotions#available-time).
#  Note that `BEGIN:VEVENT` and `END:VEVENT` are optional in a
#  `CreateLoyaltyPromotion` request
#  but are always included in the response.
    attr_reader :time_periods
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param start_date [String] The date that the promotion starts, in `YYYY-MM-DD` format. Square populates
#  this field
#  based on the provided `time_periods`.
    # @param end_date [String] The date that the promotion ends, in `YYYY-MM-DD` format. Square populates this
#  field
#  based on the provided `time_periods`. If an end date is not specified, an
#  `ACTIVE` promotion
#  remains available until it is canceled.
    # @param time_periods [Array<String>] A list of [iCalendar (RFC 5545)
#  events](https://tools.ietf.org/html/rfc5545#section-3.6.1)
#  (`VEVENT`). Each event represents an available time period per day or days of
#  the week.
#  A day can have a maximum of one available time period.
#  Only `DTSTART`, `DURATION`, and `RRULE` are supported. `DTSTART` and `DURATION`
#  are required and
#  timestamps must be in local (unzoned) time format. Include `RRULE` to specify
#  recurring promotions,
#  an end date (using the `UNTIL` keyword), or both. For more information, see
#  [Available
#  ps://developer.squareup.com/docs/loyalty-api/loyalty-promotions#available-time).
#  Note that `BEGIN:VEVENT` and `END:VEVENT` are optional in a
#  `CreateLoyaltyPromotion` request
#  but are always included in the response.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::LoyaltyPromotionAvailableTimeData]
    def initialize(start_date: OMIT, end_date: OMIT, time_periods:, additional_properties: nil)
      @start_date = start_date if start_date != OMIT
      @end_date = end_date if end_date != OMIT
      @time_periods = time_periods
      @additional_properties = additional_properties
      @_field_set = { "start_date": start_date, "end_date": end_date, "time_periods": time_periods }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyPromotionAvailableTimeData
    #
    # @param json_object [String] 
    # @return [SquareApiClient::LoyaltyPromotionAvailableTimeData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      start_date = parsed_json["start_date"]
      end_date = parsed_json["end_date"]
      time_periods = parsed_json["time_periods"]
      new(
        start_date: start_date,
        end_date: end_date,
        time_periods: time_periods,
        additional_properties: struct
      )
    end
# Serialize an instance of LoyaltyPromotionAvailableTimeData to a JSON object
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
      obj.start_date&.is_a?(String) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
      obj.end_date&.is_a?(String) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
      obj.time_periods.is_a?(Array) != false || raise("Passed value for field obj.time_periods is not the expected type, validation failed.")
    end
  end
end