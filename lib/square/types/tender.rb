# frozen_string_literal: true
require_relative "money"
require_relative "tender_type"
require_relative "tender_card_details"
require_relative "tender_cash_details"
require_relative "tender_bank_account_details"
require_relative "tender_buy_now_pay_later_details"
require_relative "tender_square_account_details"
require_relative "additional_recipient"
require "ostruct"
require "json"

module square.rb
# Represents a tender (i.e., a method of payment) used in a Square transaction.
  class Tender
  # @return [String] The tender's unique ID. It is the associated payment ID.
    attr_reader :id
  # @return [String] The ID of the transaction's associated location.
    attr_reader :location_id
  # @return [String] The ID of the tender's associated transaction.
    attr_reader :transaction_id
  # @return [String] The timestamp for when the tender was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] An optional note associated with the tender at the time of payment.
    attr_reader :note
  # @return [square.rb::Money] The total amount of the tender, including `tip_money`. If the tender has a
#  `payment_id`,
#  the `total_money` of the corresponding [Payment](entity:Payment) will be equal
#  to the
#  `amount_money` of the tender.
    attr_reader :amount_money
  # @return [square.rb::Money] The tip's amount of the tender.
    attr_reader :tip_money
  # @return [square.rb::Money] The amount of any Square processing fees applied to the tender.
#  This field is not immediately populated when a new transaction is created.
#  It is usually available after about ten seconds.
    attr_reader :processing_fee_money
  # @return [String] If the tender is associated with a customer or represents a customer's card on
#  file,
#  this is the ID of the associated customer.
    attr_reader :customer_id
  # @return [square.rb::TenderType] The type of tender, such as `CARD` or `CASH`.
#  See [TenderType](#type-tendertype) for possible values
    attr_reader :type
  # @return [square.rb::TenderCardDetails] The details of the card tender.
#  This value is present only if the value of `type` is `CARD`.
    attr_reader :card_details
  # @return [square.rb::TenderCashDetails] The details of the cash tender.
#  This value is present only if the value of `type` is `CASH`.
    attr_reader :cash_details
  # @return [square.rb::TenderBankAccountDetails] The details of the bank account tender.
#  This value is present only if the value of `type` is `BANK_ACCOUNT`.
    attr_reader :bank_account_details
  # @return [square.rb::TenderBuyNowPayLaterDetails] The details of a Buy Now Pay Later tender.
#  This value is present only if the value of `type` is `BUY_NOW_PAY_LATER`.
    attr_reader :buy_now_pay_later_details
  # @return [square.rb::TenderSquareAccountDetails] The details of a Square Account tender.
#  This value is present only if the value of `type` is `SQUARE_ACCOUNT`.
    attr_reader :square_account_details
  # @return [Array<square.rb::AdditionalRecipient>] Additional recipients (other than the merchant) receiving a portion of this
#  tender.
#  For example, fees assessed on the purchase by a third party integration.
    attr_reader :additional_recipients
  # @return [String] The ID of the [Payment](entity:Payment) that corresponds to this tender.
#  This value is only present for payments created with the v2 Payments API.
    attr_reader :payment_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The tender's unique ID. It is the associated payment ID.
    # @param location_id [String] The ID of the transaction's associated location.
    # @param transaction_id [String] The ID of the tender's associated transaction.
    # @param created_at [String] The timestamp for when the tender was created, in RFC 3339 format.
    # @param note [String] An optional note associated with the tender at the time of payment.
    # @param amount_money [square.rb::Money] The total amount of the tender, including `tip_money`. If the tender has a
#  `payment_id`,
#  the `total_money` of the corresponding [Payment](entity:Payment) will be equal
#  to the
#  `amount_money` of the tender.
    # @param tip_money [square.rb::Money] The tip's amount of the tender.
    # @param processing_fee_money [square.rb::Money] The amount of any Square processing fees applied to the tender.
#  This field is not immediately populated when a new transaction is created.
#  It is usually available after about ten seconds.
    # @param customer_id [String] If the tender is associated with a customer or represents a customer's card on
#  file,
#  this is the ID of the associated customer.
    # @param type [square.rb::TenderType] The type of tender, such as `CARD` or `CASH`.
#  See [TenderType](#type-tendertype) for possible values
    # @param card_details [square.rb::TenderCardDetails] The details of the card tender.
#  This value is present only if the value of `type` is `CARD`.
    # @param cash_details [square.rb::TenderCashDetails] The details of the cash tender.
#  This value is present only if the value of `type` is `CASH`.
    # @param bank_account_details [square.rb::TenderBankAccountDetails] The details of the bank account tender.
#  This value is present only if the value of `type` is `BANK_ACCOUNT`.
    # @param buy_now_pay_later_details [square.rb::TenderBuyNowPayLaterDetails] The details of a Buy Now Pay Later tender.
#  This value is present only if the value of `type` is `BUY_NOW_PAY_LATER`.
    # @param square_account_details [square.rb::TenderSquareAccountDetails] The details of a Square Account tender.
#  This value is present only if the value of `type` is `SQUARE_ACCOUNT`.
    # @param additional_recipients [Array<square.rb::AdditionalRecipient>] Additional recipients (other than the merchant) receiving a portion of this
#  tender.
#  For example, fees assessed on the purchase by a third party integration.
    # @param payment_id [String] The ID of the [Payment](entity:Payment) that corresponds to this tender.
#  This value is only present for payments created with the v2 Payments API.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Tender]
    def initialize(id: OMIT, location_id: OMIT, transaction_id: OMIT, created_at: OMIT, note: OMIT, amount_money: OMIT, tip_money: OMIT, processing_fee_money: OMIT, customer_id: OMIT, type:, card_details: OMIT, cash_details: OMIT, bank_account_details: OMIT, buy_now_pay_later_details: OMIT, square_account_details: OMIT, additional_recipients: OMIT, payment_id: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @location_id = location_id if location_id != OMIT
      @transaction_id = transaction_id if transaction_id != OMIT
      @created_at = created_at if created_at != OMIT
      @note = note if note != OMIT
      @amount_money = amount_money if amount_money != OMIT
      @tip_money = tip_money if tip_money != OMIT
      @processing_fee_money = processing_fee_money if processing_fee_money != OMIT
      @customer_id = customer_id if customer_id != OMIT
      @type = type
      @card_details = card_details if card_details != OMIT
      @cash_details = cash_details if cash_details != OMIT
      @bank_account_details = bank_account_details if bank_account_details != OMIT
      @buy_now_pay_later_details = buy_now_pay_later_details if buy_now_pay_later_details != OMIT
      @square_account_details = square_account_details if square_account_details != OMIT
      @additional_recipients = additional_recipients if additional_recipients != OMIT
      @payment_id = payment_id if payment_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "location_id": location_id, "transaction_id": transaction_id, "created_at": created_at, "note": note, "amount_money": amount_money, "tip_money": tip_money, "processing_fee_money": processing_fee_money, "customer_id": customer_id, "type": type, "card_details": card_details, "cash_details": cash_details, "bank_account_details": bank_account_details, "buy_now_pay_later_details": buy_now_pay_later_details, "square_account_details": square_account_details, "additional_recipients": additional_recipients, "payment_id": payment_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Tender
    #
    # @param json_object [String] 
    # @return [square.rb::Tender]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      location_id = parsed_json["location_id"]
      transaction_id = parsed_json["transaction_id"]
      created_at = parsed_json["created_at"]
      note = parsed_json["note"]
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = square.rb::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      unless parsed_json["tip_money"].nil?
        tip_money = parsed_json["tip_money"].to_json
        tip_money = square.rb::Money.from_json(json_object: tip_money)
      else
        tip_money = nil
      end
      unless parsed_json["processing_fee_money"].nil?
        processing_fee_money = parsed_json["processing_fee_money"].to_json
        processing_fee_money = square.rb::Money.from_json(json_object: processing_fee_money)
      else
        processing_fee_money = nil
      end
      customer_id = parsed_json["customer_id"]
      type = parsed_json["type"]
      unless parsed_json["card_details"].nil?
        card_details = parsed_json["card_details"].to_json
        card_details = square.rb::TenderCardDetails.from_json(json_object: card_details)
      else
        card_details = nil
      end
      unless parsed_json["cash_details"].nil?
        cash_details = parsed_json["cash_details"].to_json
        cash_details = square.rb::TenderCashDetails.from_json(json_object: cash_details)
      else
        cash_details = nil
      end
      unless parsed_json["bank_account_details"].nil?
        bank_account_details = parsed_json["bank_account_details"].to_json
        bank_account_details = square.rb::TenderBankAccountDetails.from_json(json_object: bank_account_details)
      else
        bank_account_details = nil
      end
      unless parsed_json["buy_now_pay_later_details"].nil?
        buy_now_pay_later_details = parsed_json["buy_now_pay_later_details"].to_json
        buy_now_pay_later_details = square.rb::TenderBuyNowPayLaterDetails.from_json(json_object: buy_now_pay_later_details)
      else
        buy_now_pay_later_details = nil
      end
      unless parsed_json["square_account_details"].nil?
        square_account_details = parsed_json["square_account_details"].to_json
        square_account_details = square.rb::TenderSquareAccountDetails.from_json(json_object: square_account_details)
      else
        square_account_details = nil
      end
      additional_recipients = parsed_json["additional_recipients"]&.map do | item |
  item = item.to_json
  square.rb::AdditionalRecipient.from_json(json_object: item)
end
      payment_id = parsed_json["payment_id"]
      new(
        id: id,
        location_id: location_id,
        transaction_id: transaction_id,
        created_at: created_at,
        note: note,
        amount_money: amount_money,
        tip_money: tip_money,
        processing_fee_money: processing_fee_money,
        customer_id: customer_id,
        type: type,
        card_details: card_details,
        cash_details: cash_details,
        bank_account_details: bank_account_details,
        buy_now_pay_later_details: buy_now_pay_later_details,
        square_account_details: square_account_details,
        additional_recipients: additional_recipients,
        payment_id: payment_id,
        additional_properties: struct
      )
    end
# Serialize an instance of Tender to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.transaction_id&.is_a?(String) != false || raise("Passed value for field obj.transaction_id is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
      obj.amount_money.nil? || square.rb::Money.validate_raw(obj: obj.amount_money)
      obj.tip_money.nil? || square.rb::Money.validate_raw(obj: obj.tip_money)
      obj.processing_fee_money.nil? || square.rb::Money.validate_raw(obj: obj.processing_fee_money)
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.type.is_a?(square.rb::TenderType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.card_details.nil? || square.rb::TenderCardDetails.validate_raw(obj: obj.card_details)
      obj.cash_details.nil? || square.rb::TenderCashDetails.validate_raw(obj: obj.cash_details)
      obj.bank_account_details.nil? || square.rb::TenderBankAccountDetails.validate_raw(obj: obj.bank_account_details)
      obj.buy_now_pay_later_details.nil? || square.rb::TenderBuyNowPayLaterDetails.validate_raw(obj: obj.buy_now_pay_later_details)
      obj.square_account_details.nil? || square.rb::TenderSquareAccountDetails.validate_raw(obj: obj.square_account_details)
      obj.additional_recipients&.is_a?(Array) != false || raise("Passed value for field obj.additional_recipients is not the expected type, validation failed.")
      obj.payment_id&.is_a?(String) != false || raise("Passed value for field obj.payment_id is not the expected type, validation failed.")
    end
  end
end