# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# Represents details about a `LOAD` [gift card activity
#  type](entity:GiftCardActivityType).
  class GiftCardActivityLoad
  # @return [SquareApiClient::Money] The amount added to the gift card. This value is a positive integer.
#  Applications that use a custom order processing system must specify this amount
#  in the
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  request.
    attr_reader :amount_money
  # @return [String] The ID of the [order](entity:Order) that contains the `GIFT_CARD` line item.
#  Applications that use the Square Orders API to process orders must specify the
#  order ID in the
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  request.
    attr_reader :order_id
  # @return [String] The UID of the `GIFT_CARD` line item in the order that represents the additional
#  funds for the gift card.
#  Applications that use the Square Orders API to process orders must specify the
#  line item UID
#  in the
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  request.
    attr_reader :line_item_uid
  # @return [String] A client-specified ID that associates the gift card activity with an entity in
#  another system.
#  Applications that use a custom order processing system can use this field to
#  track information related to
#  an order or payment.
    attr_reader :reference_id
  # @return [Array<String>] The payment instrument IDs used to process the order for the additional funds,
#  such as a credit card ID
#  or bank account ID.
#  Applications that use a custom order processing system must specify payment
#  instrument IDs in
#  the
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  request.
#  Square uses this information to perform compliance checks.
#  For applications that use the Square Orders API to process payments, Square has
#  the necessary
#  instrument IDs to perform compliance checks.
#  Each buyer payment instrument ID can contain a maximum of 255 characters.
    attr_reader :buyer_payment_instrument_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param amount_money [SquareApiClient::Money] The amount added to the gift card. This value is a positive integer.
#  Applications that use a custom order processing system must specify this amount
#  in the
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  request.
    # @param order_id [String] The ID of the [order](entity:Order) that contains the `GIFT_CARD` line item.
#  Applications that use the Square Orders API to process orders must specify the
#  order ID in the
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  request.
    # @param line_item_uid [String] The UID of the `GIFT_CARD` line item in the order that represents the additional
#  funds for the gift card.
#  Applications that use the Square Orders API to process orders must specify the
#  line item UID
#  in the
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  request.
    # @param reference_id [String] A client-specified ID that associates the gift card activity with an entity in
#  another system.
#  Applications that use a custom order processing system can use this field to
#  track information related to
#  an order or payment.
    # @param buyer_payment_instrument_ids [Array<String>] The payment instrument IDs used to process the order for the additional funds,
#  such as a credit card ID
#  or bank account ID.
#  Applications that use a custom order processing system must specify payment
#  instrument IDs in
#  the
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  request.
#  Square uses this information to perform compliance checks.
#  For applications that use the Square Orders API to process payments, Square has
#  the necessary
#  instrument IDs to perform compliance checks.
#  Each buyer payment instrument ID can contain a maximum of 255 characters.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GiftCardActivityLoad]
    def initialize(amount_money: OMIT, order_id: OMIT, line_item_uid: OMIT, reference_id: OMIT, buyer_payment_instrument_ids: OMIT, additional_properties: nil)
      @amount_money = amount_money if amount_money != OMIT
      @order_id = order_id if order_id != OMIT
      @line_item_uid = line_item_uid if line_item_uid != OMIT
      @reference_id = reference_id if reference_id != OMIT
      @buyer_payment_instrument_ids = buyer_payment_instrument_ids if buyer_payment_instrument_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "amount_money": amount_money, "order_id": order_id, "line_item_uid": line_item_uid, "reference_id": reference_id, "buyer_payment_instrument_ids": buyer_payment_instrument_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GiftCardActivityLoad
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GiftCardActivityLoad]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = SquareApiClient::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      order_id = parsed_json["order_id"]
      line_item_uid = parsed_json["line_item_uid"]
      reference_id = parsed_json["reference_id"]
      buyer_payment_instrument_ids = parsed_json["buyer_payment_instrument_ids"]
      new(
        amount_money: amount_money,
        order_id: order_id,
        line_item_uid: line_item_uid,
        reference_id: reference_id,
        buyer_payment_instrument_ids: buyer_payment_instrument_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of GiftCardActivityLoad to a JSON object
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
      obj.amount_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.amount_money)
      obj.order_id&.is_a?(String) != false || raise("Passed value for field obj.order_id is not the expected type, validation failed.")
      obj.line_item_uid&.is_a?(String) != false || raise("Passed value for field obj.line_item_uid is not the expected type, validation failed.")
      obj.reference_id&.is_a?(String) != false || raise("Passed value for field obj.reference_id is not the expected type, validation failed.")
      obj.buyer_payment_instrument_ids&.is_a?(Array) != false || raise("Passed value for field obj.buyer_payment_instrument_ids is not the expected type, validation failed.")
    end
  end
end