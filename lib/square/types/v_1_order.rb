# frozen_string_literal: true
require_relative "error"
require_relative "v_1_order_state"
require_relative "address"
require_relative "v_1_money"
require_relative "v_1_tender"
require_relative "v_1_order_history_entry"
require "ostruct"
require "json"

module SquareApiClient
# V1Order
  class V1Order
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [String] The order's unique identifier.
    attr_reader :id
  # @return [String] The email address of the order's buyer.
    attr_reader :buyer_email
  # @return [String] The name of the order's buyer.
    attr_reader :recipient_name
  # @return [String] The phone number to use for the order's delivery.
    attr_reader :recipient_phone_number
  # @return [SquareApiClient::V1OrderState] Whether the tax is an ADDITIVE tax or an INCLUSIVE tax.
#  See [V1OrderState](#type-v1orderstate) for possible values
    attr_reader :state
  # @return [SquareApiClient::Address] The address to ship the order to.
    attr_reader :shipping_address
  # @return [SquareApiClient::V1Money] The amount of all items purchased in the order, before taxes and shipping.
    attr_reader :subtotal_money
  # @return [SquareApiClient::V1Money] The shipping cost for the order.
    attr_reader :total_shipping_money
  # @return [SquareApiClient::V1Money] The total of all taxes applied to the order.
    attr_reader :total_tax_money
  # @return [SquareApiClient::V1Money] The total cost of the order.
    attr_reader :total_price_money
  # @return [SquareApiClient::V1Money] The total of all discounts applied to the order.
    attr_reader :total_discount_money
  # @return [String] The time when the order was created, in ISO 8601 format.
    attr_reader :created_at
  # @return [String] The time when the order was last modified, in ISO 8601 format.
    attr_reader :updated_at
  # @return [String] The time when the order expires if no action is taken, in ISO 8601 format.
    attr_reader :expires_at
  # @return [String] The unique identifier of the payment associated with the order.
    attr_reader :payment_id
  # @return [String] A note provided by the buyer when the order was created, if any.
    attr_reader :buyer_note
  # @return [String] A note provided by the merchant when the order's state was set to COMPLETED, if
#  any
    attr_reader :completed_note
  # @return [String] A note provided by the merchant when the order's state was set to REFUNDED, if
#  any.
    attr_reader :refunded_note
  # @return [String] A note provided by the merchant when the order's state was set to CANCELED, if
#  any.
    attr_reader :canceled_note
  # @return [SquareApiClient::V1Tender] The tender used to pay for the order.
    attr_reader :tender
  # @return [Array<SquareApiClient::V1OrderHistoryEntry>] The history of actions associated with the order.
    attr_reader :order_history
  # @return [String] The promo code provided by the buyer, if any.
    attr_reader :promo_code
  # @return [String] For Bitcoin transactions, the address that the buyer sent Bitcoin to.
    attr_reader :btc_receive_address
  # @return [Float] For Bitcoin transactions, the price of the buyer's order in satoshi (100 million
#  satoshi equals 1 BTC).
    attr_reader :btc_price_satoshi
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param id [String] The order's unique identifier.
    # @param buyer_email [String] The email address of the order's buyer.
    # @param recipient_name [String] The name of the order's buyer.
    # @param recipient_phone_number [String] The phone number to use for the order's delivery.
    # @param state [SquareApiClient::V1OrderState] Whether the tax is an ADDITIVE tax or an INCLUSIVE tax.
#  See [V1OrderState](#type-v1orderstate) for possible values
    # @param shipping_address [SquareApiClient::Address] The address to ship the order to.
    # @param subtotal_money [SquareApiClient::V1Money] The amount of all items purchased in the order, before taxes and shipping.
    # @param total_shipping_money [SquareApiClient::V1Money] The shipping cost for the order.
    # @param total_tax_money [SquareApiClient::V1Money] The total of all taxes applied to the order.
    # @param total_price_money [SquareApiClient::V1Money] The total cost of the order.
    # @param total_discount_money [SquareApiClient::V1Money] The total of all discounts applied to the order.
    # @param created_at [String] The time when the order was created, in ISO 8601 format.
    # @param updated_at [String] The time when the order was last modified, in ISO 8601 format.
    # @param expires_at [String] The time when the order expires if no action is taken, in ISO 8601 format.
    # @param payment_id [String] The unique identifier of the payment associated with the order.
    # @param buyer_note [String] A note provided by the buyer when the order was created, if any.
    # @param completed_note [String] A note provided by the merchant when the order's state was set to COMPLETED, if
#  any
    # @param refunded_note [String] A note provided by the merchant when the order's state was set to REFUNDED, if
#  any.
    # @param canceled_note [String] A note provided by the merchant when the order's state was set to CANCELED, if
#  any.
    # @param tender [SquareApiClient::V1Tender] The tender used to pay for the order.
    # @param order_history [Array<SquareApiClient::V1OrderHistoryEntry>] The history of actions associated with the order.
    # @param promo_code [String] The promo code provided by the buyer, if any.
    # @param btc_receive_address [String] For Bitcoin transactions, the address that the buyer sent Bitcoin to.
    # @param btc_price_satoshi [Float] For Bitcoin transactions, the price of the buyer's order in satoshi (100 million
#  satoshi equals 1 BTC).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::V1Order]
    def initialize(errors: OMIT, id: OMIT, buyer_email: OMIT, recipient_name: OMIT, recipient_phone_number: OMIT, state: OMIT, shipping_address: OMIT, subtotal_money: OMIT, total_shipping_money: OMIT, total_tax_money: OMIT, total_price_money: OMIT, total_discount_money: OMIT, created_at: OMIT, updated_at: OMIT, expires_at: OMIT, payment_id: OMIT, buyer_note: OMIT, completed_note: OMIT, refunded_note: OMIT, canceled_note: OMIT, tender: OMIT, order_history: OMIT, promo_code: OMIT, btc_receive_address: OMIT, btc_price_satoshi: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @id = id if id != OMIT
      @buyer_email = buyer_email if buyer_email != OMIT
      @recipient_name = recipient_name if recipient_name != OMIT
      @recipient_phone_number = recipient_phone_number if recipient_phone_number != OMIT
      @state = state if state != OMIT
      @shipping_address = shipping_address if shipping_address != OMIT
      @subtotal_money = subtotal_money if subtotal_money != OMIT
      @total_shipping_money = total_shipping_money if total_shipping_money != OMIT
      @total_tax_money = total_tax_money if total_tax_money != OMIT
      @total_price_money = total_price_money if total_price_money != OMIT
      @total_discount_money = total_discount_money if total_discount_money != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @expires_at = expires_at if expires_at != OMIT
      @payment_id = payment_id if payment_id != OMIT
      @buyer_note = buyer_note if buyer_note != OMIT
      @completed_note = completed_note if completed_note != OMIT
      @refunded_note = refunded_note if refunded_note != OMIT
      @canceled_note = canceled_note if canceled_note != OMIT
      @tender = tender if tender != OMIT
      @order_history = order_history if order_history != OMIT
      @promo_code = promo_code if promo_code != OMIT
      @btc_receive_address = btc_receive_address if btc_receive_address != OMIT
      @btc_price_satoshi = btc_price_satoshi if btc_price_satoshi != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "id": id, "buyer_email": buyer_email, "recipient_name": recipient_name, "recipient_phone_number": recipient_phone_number, "state": state, "shipping_address": shipping_address, "subtotal_money": subtotal_money, "total_shipping_money": total_shipping_money, "total_tax_money": total_tax_money, "total_price_money": total_price_money, "total_discount_money": total_discount_money, "created_at": created_at, "updated_at": updated_at, "expires_at": expires_at, "payment_id": payment_id, "buyer_note": buyer_note, "completed_note": completed_note, "refunded_note": refunded_note, "canceled_note": canceled_note, "tender": tender, "order_history": order_history, "promo_code": promo_code, "btc_receive_address": btc_receive_address, "btc_price_satoshi": btc_price_satoshi }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of V1Order
    #
    # @param json_object [String] 
    # @return [SquareApiClient::V1Order]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      id = parsed_json["id"]
      buyer_email = parsed_json["buyer_email"]
      recipient_name = parsed_json["recipient_name"]
      recipient_phone_number = parsed_json["recipient_phone_number"]
      state = parsed_json["state"]
      unless parsed_json["shipping_address"].nil?
        shipping_address = parsed_json["shipping_address"].to_json
        shipping_address = SquareApiClient::Address.from_json(json_object: shipping_address)
      else
        shipping_address = nil
      end
      unless parsed_json["subtotal_money"].nil?
        subtotal_money = parsed_json["subtotal_money"].to_json
        subtotal_money = SquareApiClient::V1Money.from_json(json_object: subtotal_money)
      else
        subtotal_money = nil
      end
      unless parsed_json["total_shipping_money"].nil?
        total_shipping_money = parsed_json["total_shipping_money"].to_json
        total_shipping_money = SquareApiClient::V1Money.from_json(json_object: total_shipping_money)
      else
        total_shipping_money = nil
      end
      unless parsed_json["total_tax_money"].nil?
        total_tax_money = parsed_json["total_tax_money"].to_json
        total_tax_money = SquareApiClient::V1Money.from_json(json_object: total_tax_money)
      else
        total_tax_money = nil
      end
      unless parsed_json["total_price_money"].nil?
        total_price_money = parsed_json["total_price_money"].to_json
        total_price_money = SquareApiClient::V1Money.from_json(json_object: total_price_money)
      else
        total_price_money = nil
      end
      unless parsed_json["total_discount_money"].nil?
        total_discount_money = parsed_json["total_discount_money"].to_json
        total_discount_money = SquareApiClient::V1Money.from_json(json_object: total_discount_money)
      else
        total_discount_money = nil
      end
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      expires_at = parsed_json["expires_at"]
      payment_id = parsed_json["payment_id"]
      buyer_note = parsed_json["buyer_note"]
      completed_note = parsed_json["completed_note"]
      refunded_note = parsed_json["refunded_note"]
      canceled_note = parsed_json["canceled_note"]
      unless parsed_json["tender"].nil?
        tender = parsed_json["tender"].to_json
        tender = SquareApiClient::V1Tender.from_json(json_object: tender)
      else
        tender = nil
      end
      order_history = parsed_json["order_history"]&.map do | item |
  item = item.to_json
  SquareApiClient::V1OrderHistoryEntry.from_json(json_object: item)
end
      promo_code = parsed_json["promo_code"]
      btc_receive_address = parsed_json["btc_receive_address"]
      btc_price_satoshi = parsed_json["btc_price_satoshi"]
      new(
        errors: errors,
        id: id,
        buyer_email: buyer_email,
        recipient_name: recipient_name,
        recipient_phone_number: recipient_phone_number,
        state: state,
        shipping_address: shipping_address,
        subtotal_money: subtotal_money,
        total_shipping_money: total_shipping_money,
        total_tax_money: total_tax_money,
        total_price_money: total_price_money,
        total_discount_money: total_discount_money,
        created_at: created_at,
        updated_at: updated_at,
        expires_at: expires_at,
        payment_id: payment_id,
        buyer_note: buyer_note,
        completed_note: completed_note,
        refunded_note: refunded_note,
        canceled_note: canceled_note,
        tender: tender,
        order_history: order_history,
        promo_code: promo_code,
        btc_receive_address: btc_receive_address,
        btc_price_satoshi: btc_price_satoshi,
        additional_properties: struct
      )
    end
# Serialize an instance of V1Order to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.buyer_email&.is_a?(String) != false || raise("Passed value for field obj.buyer_email is not the expected type, validation failed.")
      obj.recipient_name&.is_a?(String) != false || raise("Passed value for field obj.recipient_name is not the expected type, validation failed.")
      obj.recipient_phone_number&.is_a?(String) != false || raise("Passed value for field obj.recipient_phone_number is not the expected type, validation failed.")
      obj.state&.is_a?(SquareApiClient::V1OrderState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.shipping_address.nil? || SquareApiClient::Address.validate_raw(obj: obj.shipping_address)
      obj.subtotal_money.nil? || SquareApiClient::V1Money.validate_raw(obj: obj.subtotal_money)
      obj.total_shipping_money.nil? || SquareApiClient::V1Money.validate_raw(obj: obj.total_shipping_money)
      obj.total_tax_money.nil? || SquareApiClient::V1Money.validate_raw(obj: obj.total_tax_money)
      obj.total_price_money.nil? || SquareApiClient::V1Money.validate_raw(obj: obj.total_price_money)
      obj.total_discount_money.nil? || SquareApiClient::V1Money.validate_raw(obj: obj.total_discount_money)
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.expires_at&.is_a?(String) != false || raise("Passed value for field obj.expires_at is not the expected type, validation failed.")
      obj.payment_id&.is_a?(String) != false || raise("Passed value for field obj.payment_id is not the expected type, validation failed.")
      obj.buyer_note&.is_a?(String) != false || raise("Passed value for field obj.buyer_note is not the expected type, validation failed.")
      obj.completed_note&.is_a?(String) != false || raise("Passed value for field obj.completed_note is not the expected type, validation failed.")
      obj.refunded_note&.is_a?(String) != false || raise("Passed value for field obj.refunded_note is not the expected type, validation failed.")
      obj.canceled_note&.is_a?(String) != false || raise("Passed value for field obj.canceled_note is not the expected type, validation failed.")
      obj.tender.nil? || SquareApiClient::V1Tender.validate_raw(obj: obj.tender)
      obj.order_history&.is_a?(Array) != false || raise("Passed value for field obj.order_history is not the expected type, validation failed.")
      obj.promo_code&.is_a?(String) != false || raise("Passed value for field obj.promo_code is not the expected type, validation failed.")
      obj.btc_receive_address&.is_a?(String) != false || raise("Passed value for field obj.btc_receive_address is not the expected type, validation failed.")
      obj.btc_price_satoshi&.is_a?(Float) != false || raise("Passed value for field obj.btc_price_satoshi is not the expected type, validation failed.")
    end
  end
end