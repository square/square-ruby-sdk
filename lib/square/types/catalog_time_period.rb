# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents a time period - either a single period or a repeating period.
  class CatalogTimePeriod
  # @return [String] An iCalendar (RFC 5545)
#  [event](https://tools.ietf.org/html/rfc5545#section-3.6.1), which
#  specifies the name, timing, duration and recurrence of this time period.
#  Example:
#  ```
#  DTSTART:20190707T180000
#  DURATION:P2H
#  RRULE:FREQ=WEEKLY;BYDAY=MO,WE,FR
#  ```
#  Only `SUMMARY`, `DTSTART`, `DURATION` and `RRULE` fields are supported.
#  `DTSTART` must be in local (unzoned) time format. Note that while `BEGIN:VEVENT`
#  and `END:VEVENT` is not required in the request. The response will always
#  include them.
    attr_reader :event
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param event [String] An iCalendar (RFC 5545)
#  [event](https://tools.ietf.org/html/rfc5545#section-3.6.1), which
#  specifies the name, timing, duration and recurrence of this time period.
#  Example:
#  ```
#  DTSTART:20190707T180000
#  DURATION:P2H
#  RRULE:FREQ=WEEKLY;BYDAY=MO,WE,FR
#  ```
#  Only `SUMMARY`, `DTSTART`, `DURATION` and `RRULE` fields are supported.
#  `DTSTART` must be in local (unzoned) time format. Note that while `BEGIN:VEVENT`
#  and `END:VEVENT` is not required in the request. The response will always
#  include them.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogTimePeriod]
    def initialize(event: OMIT, additional_properties: nil)
      @event = event if event != OMIT
      @additional_properties = additional_properties
      @_field_set = { "event": event }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogTimePeriod
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogTimePeriod]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      event = parsed_json["event"]
      new(event: event, additional_properties: struct)
    end
# Serialize an instance of CatalogTimePeriod to a JSON object
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
      obj.event&.is_a?(String) != false || raise("Passed value for field obj.event is not the expected type, validation failed.")
    end
  end
end