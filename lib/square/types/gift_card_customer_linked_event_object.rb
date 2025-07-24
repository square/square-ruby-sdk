# frozen_string_literal: true
require_relative "gift_card"
require "ostruct"
require "json"

module SquareApiClient
# An object that contains the gift card and customer ID associated with a
#  `gift_card.customer_linked` event.
  class GiftCardCustomerLinkedEventObject
  # @return [SquareApiClient::GiftCard] The gift card with the updated `customer_ids` field.
    attr_reader :gift_card
  # @return [String] The ID of the linked [customer](entity:Customer).
    attr_reader :linked_customer_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param gift_card [SquareApiClient::GiftCard] The gift card with the updated `customer_ids` field.
    # @param linked_customer_id [String] The ID of the linked [customer](entity:Customer).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GiftCardCustomerLinkedEventObject]
    def initialize(gift_card: OMIT, linked_customer_id: OMIT, additional_properties: nil)
      @gift_card = gift_card if gift_card != OMIT
      @linked_customer_id = linked_customer_id if linked_customer_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "gift_card": gift_card, "linked_customer_id": linked_customer_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GiftCardCustomerLinkedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GiftCardCustomerLinkedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["gift_card"].nil?
        gift_card = parsed_json["gift_card"].to_json
        gift_card = SquareApiClient::GiftCard.from_json(json_object: gift_card)
      else
        gift_card = nil
      end
      linked_customer_id = parsed_json["linked_customer_id"]
      new(
        gift_card: gift_card,
        linked_customer_id: linked_customer_id,
        additional_properties: struct
      )
    end
# Serialize an instance of GiftCardCustomerLinkedEventObject to a JSON object
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
      obj.linked_customer_id&.is_a?(String) != false || raise("Passed value for field obj.linked_customer_id is not the expected type, validation failed.")
    end
  end
end