# frozen_string_literal: true
require_relative "money"
require_relative "gift_card_activity_redeem_status"
require "ostruct"
require "json"

module SquareApiClient
# Represents details about a `REDEEM` [gift card activity
#  type](entity:GiftCardActivityType).
  class GiftCardActivityRedeem
  # @return [SquareApiClient::Money] The amount deducted from the gift card for the redemption. This value is a
#  positive integer.
#  Applications that use a custom payment processing system must specify this
#  amount in the
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  request.
    attr_reader :amount_money
  # @return [String] The ID of the payment that represents the gift card redemption. Square populates
#  this field
#  if the payment was processed by Square.
    attr_reader :payment_id
  # @return [String] A client-specified ID that associates the gift card activity with an entity in
#  another system.
#  Applications that use a custom payment processing system can use this field to
#  track information
#  related to an order or payment.
    attr_reader :reference_id
  # @return [SquareApiClient::GiftCardActivityRedeemStatus] The status of the gift card redemption. Gift cards redeemed from Square Point of
#  Sale or the
#  Square Seller Dashboard use a two-state process: `PENDING`
#  to `COMPLETED` or `PENDING` to  `CANCELED`. Gift cards redeemed using the Gift
#  Card Activities API
#  always have a `COMPLETED` status.
#  See [Status](#type-status) for possible values
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param amount_money [SquareApiClient::Money] The amount deducted from the gift card for the redemption. This value is a
#  positive integer.
#  Applications that use a custom payment processing system must specify this
#  amount in the
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  request.
    # @param payment_id [String] The ID of the payment that represents the gift card redemption. Square populates
#  this field
#  if the payment was processed by Square.
    # @param reference_id [String] A client-specified ID that associates the gift card activity with an entity in
#  another system.
#  Applications that use a custom payment processing system can use this field to
#  track information
#  related to an order or payment.
    # @param status [SquareApiClient::GiftCardActivityRedeemStatus] The status of the gift card redemption. Gift cards redeemed from Square Point of
#  Sale or the
#  Square Seller Dashboard use a two-state process: `PENDING`
#  to `COMPLETED` or `PENDING` to  `CANCELED`. Gift cards redeemed using the Gift
#  Card Activities API
#  always have a `COMPLETED` status.
#  See [Status](#type-status) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GiftCardActivityRedeem]
    def initialize(amount_money:, payment_id: OMIT, reference_id: OMIT, status: OMIT, additional_properties: nil)
      @amount_money = amount_money
      @payment_id = payment_id if payment_id != OMIT
      @reference_id = reference_id if reference_id != OMIT
      @status = status if status != OMIT
      @additional_properties = additional_properties
      @_field_set = { "amount_money": amount_money, "payment_id": payment_id, "reference_id": reference_id, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GiftCardActivityRedeem
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GiftCardActivityRedeem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = SquareApiClient::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      payment_id = parsed_json["payment_id"]
      reference_id = parsed_json["reference_id"]
      status = parsed_json["status"]
      new(
        amount_money: amount_money,
        payment_id: payment_id,
        reference_id: reference_id,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of GiftCardActivityRedeem to a JSON object
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
      SquareApiClient::Money.validate_raw(obj: obj.amount_money)
      obj.payment_id&.is_a?(String) != false || raise("Passed value for field obj.payment_id is not the expected type, validation failed.")
      obj.reference_id&.is_a?(String) != false || raise("Passed value for field obj.reference_id is not the expected type, validation failed.")
      obj.status&.is_a?(SquareApiClient::GiftCardActivityRedeemStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end