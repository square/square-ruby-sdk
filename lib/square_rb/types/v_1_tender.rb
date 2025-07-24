# frozen_string_literal: true
require_relative "v_1_tender_type"
require_relative "v_1_tender_card_brand"
require_relative "v_1_tender_entry_method"
require_relative "v_1_money"
require "ostruct"
require "json"

module SquareApiClient
# A tender represents a discrete monetary exchange. Square represents this
#  exchange as a money object with a specific currency and amount, where the
#  amount is given in the smallest denomination of the given currency.
#  Square POS can accept more than one form of tender for a single payment (such
#  as by splitting a bill between a credit card and a gift card). The `tender`
#  field of the Payment object lists all forms of tender used for the payment.
#  Split tender payments behave slightly differently from single tender payments:
#  The receipt_url for a split tender corresponds only to the first tender listed
#  in the tender field. To get the receipt URLs for the remaining tenders, use
#  the receipt_url fields of the corresponding Tender objects.
#  *A note on gift cards**: when a customer purchases a Square gift card from a
#  merchant, the merchant receives the full amount of the gift card in the
#  associated payment.
#  When that gift card is used as a tender, the balance of the gift card is
#  reduced and the merchant receives no funds. A `Tender` object with a type of
#  `SQUARE_GIFT_CARD` indicates a gift card was used for some or all of the
#  associated payment.
  class V1Tender
  # @return [String] The tender's unique ID.
    attr_reader :id
  # @return [SquareApiClient::V1TenderType] The type of tender.
#  See [V1TenderType](#type-v1tendertype) for possible values
    attr_reader :type
  # @return [String] A human-readable description of the tender.
    attr_reader :name
  # @return [String] The ID of the employee that processed the tender.
    attr_reader :employee_id
  # @return [String] The URL of the receipt for the tender.
    attr_reader :receipt_url
  # @return [SquareApiClient::V1TenderCardBrand] The brand of credit card provided.
#  See [V1TenderCardBrand](#type-v1tendercardbrand) for possible values
    attr_reader :card_brand
  # @return [String] The last four digits of the provided credit card's account number.
    attr_reader :pan_suffix
  # @return [SquareApiClient::V1TenderEntryMethod] The tender's unique ID.
#  See [V1TenderEntryMethod](#type-v1tenderentrymethod) for possible values
    attr_reader :entry_method
  # @return [String] Notes entered by the merchant about the tender at the time of payment, if any.
#  Typically only present for tender with the type: OTHER.
    attr_reader :payment_note
  # @return [SquareApiClient::V1Money] The total amount of money provided in this form of tender.
    attr_reader :total_money
  # @return [SquareApiClient::V1Money] The amount of total_money applied to the payment.
    attr_reader :tendered_money
  # @return [String] The time when the tender was created, in ISO 8601 format.
    attr_reader :tendered_at
  # @return [String] The time when the tender was settled, in ISO 8601 format.
    attr_reader :settled_at
  # @return [SquareApiClient::V1Money] The amount of total_money returned to the buyer as change.
    attr_reader :change_back_money
  # @return [SquareApiClient::V1Money] The total of all refunds applied to this tender. This amount is always negative
#  or zero.
    attr_reader :refunded_money
  # @return [Boolean] Indicates whether or not the tender is associated with an exchange. If
#  is_exchange is true, the tender represents the value of goods returned in an
#  exchange not the actual money paid. The exchange value reduces the tender
#  amounts needed to pay for items purchased in the exchange.
    attr_reader :is_exchange
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The tender's unique ID.
    # @param type [SquareApiClient::V1TenderType] The type of tender.
#  See [V1TenderType](#type-v1tendertype) for possible values
    # @param name [String] A human-readable description of the tender.
    # @param employee_id [String] The ID of the employee that processed the tender.
    # @param receipt_url [String] The URL of the receipt for the tender.
    # @param card_brand [SquareApiClient::V1TenderCardBrand] The brand of credit card provided.
#  See [V1TenderCardBrand](#type-v1tendercardbrand) for possible values
    # @param pan_suffix [String] The last four digits of the provided credit card's account number.
    # @param entry_method [SquareApiClient::V1TenderEntryMethod] The tender's unique ID.
#  See [V1TenderEntryMethod](#type-v1tenderentrymethod) for possible values
    # @param payment_note [String] Notes entered by the merchant about the tender at the time of payment, if any.
#  Typically only present for tender with the type: OTHER.
    # @param total_money [SquareApiClient::V1Money] The total amount of money provided in this form of tender.
    # @param tendered_money [SquareApiClient::V1Money] The amount of total_money applied to the payment.
    # @param tendered_at [String] The time when the tender was created, in ISO 8601 format.
    # @param settled_at [String] The time when the tender was settled, in ISO 8601 format.
    # @param change_back_money [SquareApiClient::V1Money] The amount of total_money returned to the buyer as change.
    # @param refunded_money [SquareApiClient::V1Money] The total of all refunds applied to this tender. This amount is always negative
#  or zero.
    # @param is_exchange [Boolean] Indicates whether or not the tender is associated with an exchange. If
#  is_exchange is true, the tender represents the value of goods returned in an
#  exchange not the actual money paid. The exchange value reduces the tender
#  amounts needed to pay for items purchased in the exchange.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::V1Tender]
    def initialize(id: OMIT, type: OMIT, name: OMIT, employee_id: OMIT, receipt_url: OMIT, card_brand: OMIT, pan_suffix: OMIT, entry_method: OMIT, payment_note: OMIT, total_money: OMIT, tendered_money: OMIT, tendered_at: OMIT, settled_at: OMIT, change_back_money: OMIT, refunded_money: OMIT, is_exchange: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @type = type if type != OMIT
      @name = name if name != OMIT
      @employee_id = employee_id if employee_id != OMIT
      @receipt_url = receipt_url if receipt_url != OMIT
      @card_brand = card_brand if card_brand != OMIT
      @pan_suffix = pan_suffix if pan_suffix != OMIT
      @entry_method = entry_method if entry_method != OMIT
      @payment_note = payment_note if payment_note != OMIT
      @total_money = total_money if total_money != OMIT
      @tendered_money = tendered_money if tendered_money != OMIT
      @tendered_at = tendered_at if tendered_at != OMIT
      @settled_at = settled_at if settled_at != OMIT
      @change_back_money = change_back_money if change_back_money != OMIT
      @refunded_money = refunded_money if refunded_money != OMIT
      @is_exchange = is_exchange if is_exchange != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "type": type, "name": name, "employee_id": employee_id, "receipt_url": receipt_url, "card_brand": card_brand, "pan_suffix": pan_suffix, "entry_method": entry_method, "payment_note": payment_note, "total_money": total_money, "tendered_money": tendered_money, "tendered_at": tendered_at, "settled_at": settled_at, "change_back_money": change_back_money, "refunded_money": refunded_money, "is_exchange": is_exchange }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of V1Tender
    #
    # @param json_object [String] 
    # @return [SquareApiClient::V1Tender]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      type = parsed_json["type"]
      name = parsed_json["name"]
      employee_id = parsed_json["employee_id"]
      receipt_url = parsed_json["receipt_url"]
      card_brand = parsed_json["card_brand"]
      pan_suffix = parsed_json["pan_suffix"]
      entry_method = parsed_json["entry_method"]
      payment_note = parsed_json["payment_note"]
      unless parsed_json["total_money"].nil?
        total_money = parsed_json["total_money"].to_json
        total_money = SquareApiClient::V1Money.from_json(json_object: total_money)
      else
        total_money = nil
      end
      unless parsed_json["tendered_money"].nil?
        tendered_money = parsed_json["tendered_money"].to_json
        tendered_money = SquareApiClient::V1Money.from_json(json_object: tendered_money)
      else
        tendered_money = nil
      end
      tendered_at = parsed_json["tendered_at"]
      settled_at = parsed_json["settled_at"]
      unless parsed_json["change_back_money"].nil?
        change_back_money = parsed_json["change_back_money"].to_json
        change_back_money = SquareApiClient::V1Money.from_json(json_object: change_back_money)
      else
        change_back_money = nil
      end
      unless parsed_json["refunded_money"].nil?
        refunded_money = parsed_json["refunded_money"].to_json
        refunded_money = SquareApiClient::V1Money.from_json(json_object: refunded_money)
      else
        refunded_money = nil
      end
      is_exchange = parsed_json["is_exchange"]
      new(
        id: id,
        type: type,
        name: name,
        employee_id: employee_id,
        receipt_url: receipt_url,
        card_brand: card_brand,
        pan_suffix: pan_suffix,
        entry_method: entry_method,
        payment_note: payment_note,
        total_money: total_money,
        tendered_money: tendered_money,
        tendered_at: tendered_at,
        settled_at: settled_at,
        change_back_money: change_back_money,
        refunded_money: refunded_money,
        is_exchange: is_exchange,
        additional_properties: struct
      )
    end
# Serialize an instance of V1Tender to a JSON object
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
      obj.type&.is_a?(SquareApiClient::V1TenderType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.employee_id&.is_a?(String) != false || raise("Passed value for field obj.employee_id is not the expected type, validation failed.")
      obj.receipt_url&.is_a?(String) != false || raise("Passed value for field obj.receipt_url is not the expected type, validation failed.")
      obj.card_brand&.is_a?(SquareApiClient::V1TenderCardBrand) != false || raise("Passed value for field obj.card_brand is not the expected type, validation failed.")
      obj.pan_suffix&.is_a?(String) != false || raise("Passed value for field obj.pan_suffix is not the expected type, validation failed.")
      obj.entry_method&.is_a?(SquareApiClient::V1TenderEntryMethod) != false || raise("Passed value for field obj.entry_method is not the expected type, validation failed.")
      obj.payment_note&.is_a?(String) != false || raise("Passed value for field obj.payment_note is not the expected type, validation failed.")
      obj.total_money.nil? || SquareApiClient::V1Money.validate_raw(obj: obj.total_money)
      obj.tendered_money.nil? || SquareApiClient::V1Money.validate_raw(obj: obj.tendered_money)
      obj.tendered_at&.is_a?(String) != false || raise("Passed value for field obj.tendered_at is not the expected type, validation failed.")
      obj.settled_at&.is_a?(String) != false || raise("Passed value for field obj.settled_at is not the expected type, validation failed.")
      obj.change_back_money.nil? || SquareApiClient::V1Money.validate_raw(obj: obj.change_back_money)
      obj.refunded_money.nil? || SquareApiClient::V1Money.validate_raw(obj: obj.refunded_money)
      obj.is_exchange&.is_a?(Boolean) != false || raise("Passed value for field obj.is_exchange is not the expected type, validation failed.")
    end
  end
end