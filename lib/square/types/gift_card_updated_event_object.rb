# frozen_string_literal: true
require_relative "gift_card"
require "ostruct"
require "json"

module SquareApiClient
# An object that contains the gift card associated with a `gift_card.updated`
#  event.
  class GiftCardUpdatedEventObject
  # @return [SquareApiClient::GiftCard] The gift card with the updated `balance_money`, `state`, or `customer_ids`
#  field.
#  Some events can affect both `balance_money` and `state`.
    attr_reader :gift_card
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param gift_card [SquareApiClient::GiftCard] The gift card with the updated `balance_money`, `state`, or `customer_ids`
#  field.
#  Some events can affect both `balance_money` and `state`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GiftCardUpdatedEventObject]
    def initialize(gift_card: OMIT, additional_properties: nil)
      @gift_card = gift_card if gift_card != OMIT
      @additional_properties = additional_properties
      @_field_set = { "gift_card": gift_card }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GiftCardUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GiftCardUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["gift_card"].nil?
        gift_card = parsed_json["gift_card"].to_json
        gift_card = SquareApiClient::GiftCard.from_json(json_object: gift_card)
      else
        gift_card = nil
      end
      new(gift_card: gift_card, additional_properties: struct)
    end
# Serialize an instance of GiftCardUpdatedEventObject to a JSON object
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
      obj.gift_card.nil? || SquareApiClient::GiftCard.validate_raw(obj: obj.gift_card)
    end
  end
end