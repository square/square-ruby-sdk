# frozen_string_literal: true
require_relative "money"
require_relative "refund_status"
require_relative "additional_recipient"
require "ostruct"
require "json"

module SquareApiClient
# Represents a refund processed for a Square transaction.
  class Refund
  # @return [String] The refund's unique ID.
    attr_reader :id
  # @return [String] The ID of the refund's associated location.
    attr_reader :location_id
  # @return [String] The ID of the transaction that the refunded tender is part of.
    attr_reader :transaction_id
  # @return [String] The ID of the refunded tender.
    attr_reader :tender_id
  # @return [String] The timestamp for when the refund was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The reason for the refund being issued.
    attr_reader :reason
  # @return [SquareApiClient::Money] The amount of money refunded to the buyer.
    attr_reader :amount_money
  # @return [SquareApiClient::RefundStatus] The current status of the refund (`PENDING`, `APPROVED`, `REJECTED`,
#  or `FAILED`).
#  See [RefundStatus](#type-refundstatus) for possible values
    attr_reader :status
  # @return [SquareApiClient::Money] The amount of Square processing fee money refunded to the *merchant*.
    attr_reader :processing_fee_money
  # @return [Array<SquareApiClient::AdditionalRecipient>] Additional recipients (other than the merchant) receiving a portion of this
#  refund.
#  For example, fees assessed on a refund of a purchase by a third party
#  integration.
    attr_reader :additional_recipients
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The refund's unique ID.
    # @param location_id [String] The ID of the refund's associated location.
    # @param transaction_id [String] The ID of the transaction that the refunded tender is part of.
    # @param tender_id [String] The ID of the refunded tender.
    # @param created_at [String] The timestamp for when the refund was created, in RFC 3339 format.
    # @param reason [String] The reason for the refund being issued.
    # @param amount_money [SquareApiClient::Money] The amount of money refunded to the buyer.
    # @param status [SquareApiClient::RefundStatus] The current status of the refund (`PENDING`, `APPROVED`, `REJECTED`,
#  or `FAILED`).
#  See [RefundStatus](#type-refundstatus) for possible values
    # @param processing_fee_money [SquareApiClient::Money] The amount of Square processing fee money refunded to the *merchant*.
    # @param additional_recipients [Array<SquareApiClient::AdditionalRecipient>] Additional recipients (other than the merchant) receiving a portion of this
#  refund.
#  For example, fees assessed on a refund of a purchase by a third party
#  integration.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::Refund]
    def initialize(id:, location_id:, transaction_id: OMIT, tender_id: OMIT, created_at: OMIT, reason:, amount_money:, status:, processing_fee_money: OMIT, additional_recipients: OMIT, additional_properties: nil)
      @id = id
      @location_id = location_id
      @transaction_id = transaction_id if transaction_id != OMIT
      @tender_id = tender_id if tender_id != OMIT
      @created_at = created_at if created_at != OMIT
      @reason = reason
      @amount_money = amount_money
      @status = status
      @processing_fee_money = processing_fee_money if processing_fee_money != OMIT
      @additional_recipients = additional_recipients if additional_recipients != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "location_id": location_id, "transaction_id": transaction_id, "tender_id": tender_id, "created_at": created_at, "reason": reason, "amount_money": amount_money, "status": status, "processing_fee_money": processing_fee_money, "additional_recipients": additional_recipients }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Refund
    #
    # @param json_object [String] 
    # @return [SquareApiClient::Refund]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      location_id = parsed_json["location_id"]
      transaction_id = parsed_json["transaction_id"]
      tender_id = parsed_json["tender_id"]
      created_at = parsed_json["created_at"]
      reason = parsed_json["reason"]
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = SquareApiClient::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      status = parsed_json["status"]
      unless parsed_json["processing_fee_money"].nil?
        processing_fee_money = parsed_json["processing_fee_money"].to_json
        processing_fee_money = SquareApiClient::Money.from_json(json_object: processing_fee_money)
      else
        processing_fee_money = nil
      end
      additional_recipients = parsed_json["additional_recipients"]&.map do | item |
  item = item.to_json
  SquareApiClient::AdditionalRecipient.from_json(json_object: item)
end
      new(
        id: id,
        location_id: location_id,
        transaction_id: transaction_id,
        tender_id: tender_id,
        created_at: created_at,
        reason: reason,
        amount_money: amount_money,
        status: status,
        processing_fee_money: processing_fee_money,
        additional_recipients: additional_recipients,
        additional_properties: struct
      )
    end
# Serialize an instance of Refund to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.location_id.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.transaction_id&.is_a?(String) != false || raise("Passed value for field obj.transaction_id is not the expected type, validation failed.")
      obj.tender_id&.is_a?(String) != false || raise("Passed value for field obj.tender_id is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.reason.is_a?(String) != false || raise("Passed value for field obj.reason is not the expected type, validation failed.")
      SquareApiClient::Money.validate_raw(obj: obj.amount_money)
      obj.status.is_a?(SquareApiClient::RefundStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.processing_fee_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.processing_fee_money)
      obj.additional_recipients&.is_a?(Array) != false || raise("Passed value for field obj.additional_recipients is not the expected type, validation failed.")
    end
  end
end