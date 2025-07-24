# frozen_string_literal: true
require_relative "error"
require_relative "subscription_event"
require "ostruct"
require "json"

module SquareApiClient
# Defines output parameters in a response from the
#  [ListSubscriptionEvents](api-endpoint:Subscriptions-ListSubscriptionEvents).
  class ListSubscriptionEventsResponse
  # @return [Array<SquareApiClient::Error>] Errors encountered during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::SubscriptionEvent>] The retrieved subscription events.
    attr_reader :subscription_events
  # @return [String] When the total number of resulting subscription events exceeds the limit of a
#  paged response,
#  the response includes a cursor for you to use in a subsequent request to fetch
#  the next set of events.
#  If the cursor is unset, the response contains the last page of the results.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Errors encountered during the request.
    # @param subscription_events [Array<SquareApiClient::SubscriptionEvent>] The retrieved subscription events.
    # @param cursor [String] When the total number of resulting subscription events exceeds the limit of a
#  paged response,
#  the response includes a cursor for you to use in a subsequent request to fetch
#  the next set of events.
#  If the cursor is unset, the response contains the last page of the results.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ListSubscriptionEventsResponse]
    def initialize(errors: OMIT, subscription_events: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @subscription_events = subscription_events if subscription_events != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "subscription_events": subscription_events, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListSubscriptionEventsResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ListSubscriptionEventsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      subscription_events = parsed_json["subscription_events"]&.map do | item |
  item = item.to_json
  SquareApiClient::SubscriptionEvent.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        subscription_events: subscription_events,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListSubscriptionEventsResponse to a JSON object
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
      obj.subscription_events&.is_a?(Array) != false || raise("Passed value for field obj.subscription_events is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end