# frozen_string_literal: true
require_relative "error"
require_relative "gift_card"
require "ostruct"
require "json"

module square.rb
# A response that contains a list of `GiftCard` objects. If the request resulted
#  in errors,
#  the response contains a set of `Error` objects.
  class ListGiftCardsResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [Array<square.rb::GiftCard>] The requested gift cards or an empty object if none are found.
    attr_reader :gift_cards
  # @return [String] When a response is truncated, it includes a cursor that you can use in a
#  subsequent request to retrieve the next set of gift cards. If a cursor is not
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

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param gift_cards [Array<square.rb::GiftCard>] The requested gift cards or an empty object if none are found.
    # @param cursor [String] When a response is truncated, it includes a cursor that you can use in a
#  subsequent request to retrieve the next set of gift cards. If a cursor is not
#  present, this is
#  the final response.
#  For more information, see
#  [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ListGiftCardsResponse]
    def initialize(errors: OMIT, gift_cards: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @gift_cards = gift_cards if gift_cards != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "gift_cards": gift_cards, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListGiftCardsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::ListGiftCardsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      gift_cards = parsed_json["gift_cards"]&.map do | item |
  item = item.to_json
  square.rb::GiftCard.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        gift_cards: gift_cards,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListGiftCardsResponse to a JSON object
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
      obj.gift_cards&.is_a?(Array) != false || raise("Passed value for field obj.gift_cards is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end