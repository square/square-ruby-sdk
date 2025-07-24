# frozen_string_literal: true
require_relative "error"
require_relative "gift_card_activity"
require "ostruct"
require "json"

module SquareApiClient
# A response that contains a list of `GiftCardActivity` objects. If the request
#  resulted in errors,
#  the response contains a set of `Error` objects.
  class ListGiftCardActivitiesResponse
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<SquareApiClient::GiftCardActivity>] The requested gift card activities or an empty object if none are found.
    attr_reader :gift_card_activities
  # @return [String] When a response is truncated, it includes a cursor that you can use in a
#  subsequent request to retrieve the next set of activities. If a cursor is not
#  present, this is
#  the final response.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param gift_card_activities [Array<SquareApiClient::GiftCardActivity>] The requested gift card activities or an empty object if none are found.
    # @param cursor [String] When a response is truncated, it includes a cursor that you can use in a
#  subsequent request to retrieve the next set of activities. If a cursor is not
#  present, this is
#  the final response.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::ListGiftCardActivitiesResponse]
    def initialize(errors: OMIT, gift_card_activities: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @gift_card_activities = gift_card_activities if gift_card_activities != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "gift_card_activities": gift_card_activities, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListGiftCardActivitiesResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::ListGiftCardActivitiesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      gift_card_activities = parsed_json["gift_card_activities"]&.map do | item |
  item = item.to_json
  SquareApiClient::GiftCardActivity.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        gift_card_activities: gift_card_activities,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListGiftCardActivitiesResponse to a JSON object
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
      obj.gift_card_activities&.is_a?(Array) != false || raise("Passed value for field obj.gift_card_activities is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end