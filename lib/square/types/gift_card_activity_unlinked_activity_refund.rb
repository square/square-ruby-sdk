# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# Represents details about an `UNLINKED_ACTIVITY_REFUND` [gift card activity
#  type](entity:GiftCardActivityType).
  class GiftCardActivityUnlinkedActivityRefund
  # @return [square.rb::Money] The amount added to the gift card for the refund. This value is a positive
#  integer.
    attr_reader :amount_money
  # @return [String] A client-specified ID that associates the gift card activity with an entity in
#  another system.
    attr_reader :reference_id
  # @return [String] The ID of the refunded payment. This field is not used starting in Square
#  version 2022-06-16.
    attr_reader :payment_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param amount_money [square.rb::Money] The amount added to the gift card for the refund. This value is a positive
#  integer.
    # @param reference_id [String] A client-specified ID that associates the gift card activity with an entity in
#  another system.
    # @param payment_id [String] The ID of the refunded payment. This field is not used starting in Square
#  version 2022-06-16.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GiftCardActivityUnlinkedActivityRefund]
    def initialize(amount_money:, reference_id: OMIT, payment_id: OMIT, additional_properties: nil)
      @amount_money = amount_money
      @reference_id = reference_id if reference_id != OMIT
      @payment_id = payment_id if payment_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "amount_money": amount_money, "reference_id": reference_id, "payment_id": payment_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  GiftCardActivityUnlinkedActivityRefund
    #
    # @param json_object [String] 
    # @return [square.rb::GiftCardActivityUnlinkedActivityRefund]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = square.rb::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      reference_id = parsed_json["reference_id"]
      payment_id = parsed_json["payment_id"]
      new(
        amount_money: amount_money,
        reference_id: reference_id,
        payment_id: payment_id,
        additional_properties: struct
      )
    end
# Serialize an instance of GiftCardActivityUnlinkedActivityRefund to a JSON object
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
      square.rb::Money.validate_raw(obj: obj.amount_money)
      obj.reference_id&.is_a?(String) != false || raise("Passed value for field obj.reference_id is not the expected type, validation failed.")
      obj.payment_id&.is_a?(String) != false || raise("Passed value for field obj.payment_id is not the expected type, validation failed.")
    end
  end
end