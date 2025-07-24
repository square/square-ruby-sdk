# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# Represents details about a `REFUND` [gift card activity
#  type](entity:GiftCardActivityType).
  class GiftCardActivityRefund
  # @return [String] The ID of the refunded `REDEEM` gift card activity. Square populates this field
#  if the
#  `payment_id` in the corresponding
#  [RefundPayment](api-endpoint:Refunds-RefundPayment) request
#  represents a gift card redemption.
#  For applications that use a custom payment processing system, this field is
#  required when creating
#  a `REFUND` activity. The provided `REDEEM` activity ID must be linked to the
#  same gift card.
    attr_reader :redeem_activity_id
  # @return [square.rb::Money] The amount added to the gift card for the refund. This value is a positive
#  integer.
#  This field is required when creating a `REFUND` activity. The amount can
#  represent a full or partial refund.
    attr_reader :amount_money
  # @return [String] A client-specified ID that associates the gift card activity with an entity in
#  another system.
    attr_reader :reference_id
  # @return [String] The ID of the refunded payment. Square populates this field if the refund is for
#  a
#  payment processed by Square. This field matches the `payment_id` in the
#  corresponding
#  [RefundPayment](api-endpoint:Refunds-RefundPayment) request.
    attr_reader :payment_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param redeem_activity_id [String] The ID of the refunded `REDEEM` gift card activity. Square populates this field
#  if the
#  `payment_id` in the corresponding
#  [RefundPayment](api-endpoint:Refunds-RefundPayment) request
#  represents a gift card redemption.
#  For applications that use a custom payment processing system, this field is
#  required when creating
#  a `REFUND` activity. The provided `REDEEM` activity ID must be linked to the
#  same gift card.
    # @param amount_money [square.rb::Money] The amount added to the gift card for the refund. This value is a positive
#  integer.
#  This field is required when creating a `REFUND` activity. The amount can
#  represent a full or partial refund.
    # @param reference_id [String] A client-specified ID that associates the gift card activity with an entity in
#  another system.
    # @param payment_id [String] The ID of the refunded payment. Square populates this field if the refund is for
#  a
#  payment processed by Square. This field matches the `payment_id` in the
#  corresponding
#  [RefundPayment](api-endpoint:Refunds-RefundPayment) request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GiftCardActivityRefund]
    def initialize(redeem_activity_id: OMIT, amount_money: OMIT, reference_id: OMIT, payment_id: OMIT, additional_properties: nil)
      @redeem_activity_id = redeem_activity_id if redeem_activity_id != OMIT
      @amount_money = amount_money if amount_money != OMIT
      @reference_id = reference_id if reference_id != OMIT
      @payment_id = payment_id if payment_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "redeem_activity_id": redeem_activity_id, "amount_money": amount_money, "reference_id": reference_id, "payment_id": payment_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GiftCardActivityRefund
    #
    # @param json_object [String] 
    # @return [square.rb::GiftCardActivityRefund]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      redeem_activity_id = parsed_json["redeem_activity_id"]
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = square.rb::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      reference_id = parsed_json["reference_id"]
      payment_id = parsed_json["payment_id"]
      new(
        redeem_activity_id: redeem_activity_id,
        amount_money: amount_money,
        reference_id: reference_id,
        payment_id: payment_id,
        additional_properties: struct
      )
    end
# Serialize an instance of GiftCardActivityRefund to a JSON object
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
      obj.redeem_activity_id&.is_a?(String) != false || raise("Passed value for field obj.redeem_activity_id is not the expected type, validation failed.")
      obj.amount_money.nil? || square.rb::Money.validate_raw(obj: obj.amount_money)
      obj.reference_id&.is_a?(String) != false || raise("Passed value for field obj.reference_id is not the expected type, validation failed.")
      obj.payment_id&.is_a?(String) != false || raise("Passed value for field obj.payment_id is not the expected type, validation failed.")
    end
  end
end