# frozen_string_literal: true
require_relative "money"
require_relative "action_cancel_reason"
require "ostruct"
require "json"

module SquareApiClient
# Represents a payment refund processed by the Square Terminal. Only supports
#  Interac (Canadian debit network) payment refunds.
  class TerminalRefund
  # @return [String] A unique ID for this `TerminalRefund`.
    attr_reader :id
  # @return [String] The reference to the payment refund created by completing this `TerminalRefund`.
    attr_reader :refund_id
  # @return [String] The unique ID of the payment being refunded.
    attr_reader :payment_id
  # @return [String] The reference to the Square order ID for the payment identified by the
#  `payment_id`.
    attr_reader :order_id
  # @return [SquareApiClient::Money] The amount of money, inclusive of `tax_money`, that the `TerminalRefund` should
#  return.
#  This value is limited to the amount taken in the original payment minus any
#  completed or
#  pending refunds.
    attr_reader :amount_money
  # @return [String] A description of the reason for the refund.
    attr_reader :reason
  # @return [String] The unique ID of the device intended for this `TerminalRefund`.
#  The Id can be retrieved from /v2/devices api.
    attr_reader :device_id
  # @return [String] The RFC 3339 duration, after which the refund is automatically canceled.
#  A `TerminalRefund` that is `PENDING` is automatically `CANCELED` and has a
#  cancellation reason
#  of `TIMED_OUT`.
#  Default: 5 minutes from creation.
#  Maximum: 5 minutes
    attr_reader :deadline_duration
  # @return [String] The status of the `TerminalRefund`.
#  Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, or
#  `COMPLETED`.
    attr_reader :status
  # @return [SquareApiClient::ActionCancelReason] Present if the status is `CANCELED`.
#  See [ActionCancelReason](#type-actioncancelreason) for possible values
    attr_reader :cancel_reason
  # @return [String] The time when the `TerminalRefund` was created, as an RFC 3339 timestamp.
    attr_reader :created_at
  # @return [String] The time when the `TerminalRefund` was last updated, as an RFC 3339 timestamp.
    attr_reader :updated_at
  # @return [String] The ID of the application that created the refund.
    attr_reader :app_id
  # @return [String] The location of the device where the `TerminalRefund` was directed.
    attr_reader :location_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A unique ID for this `TerminalRefund`.
    # @param refund_id [String] The reference to the payment refund created by completing this `TerminalRefund`.
    # @param payment_id [String] The unique ID of the payment being refunded.
    # @param order_id [String] The reference to the Square order ID for the payment identified by the
#  `payment_id`.
    # @param amount_money [SquareApiClient::Money] The amount of money, inclusive of `tax_money`, that the `TerminalRefund` should
#  return.
#  This value is limited to the amount taken in the original payment minus any
#  completed or
#  pending refunds.
    # @param reason [String] A description of the reason for the refund.
    # @param device_id [String] The unique ID of the device intended for this `TerminalRefund`.
#  The Id can be retrieved from /v2/devices api.
    # @param deadline_duration [String] The RFC 3339 duration, after which the refund is automatically canceled.
#  A `TerminalRefund` that is `PENDING` is automatically `CANCELED` and has a
#  cancellation reason
#  of `TIMED_OUT`.
#  Default: 5 minutes from creation.
#  Maximum: 5 minutes
    # @param status [String] The status of the `TerminalRefund`.
#  Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, or
#  `COMPLETED`.
    # @param cancel_reason [SquareApiClient::ActionCancelReason] Present if the status is `CANCELED`.
#  See [ActionCancelReason](#type-actioncancelreason) for possible values
    # @param created_at [String] The time when the `TerminalRefund` was created, as an RFC 3339 timestamp.
    # @param updated_at [String] The time when the `TerminalRefund` was last updated, as an RFC 3339 timestamp.
    # @param app_id [String] The ID of the application that created the refund.
    # @param location_id [String] The location of the device where the `TerminalRefund` was directed.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TerminalRefund]
    def initialize(id: OMIT, refund_id: OMIT, payment_id:, order_id: OMIT, amount_money:, reason:, device_id:, deadline_duration: OMIT, status: OMIT, cancel_reason: OMIT, created_at: OMIT, updated_at: OMIT, app_id: OMIT, location_id: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @refund_id = refund_id if refund_id != OMIT
      @payment_id = payment_id
      @order_id = order_id if order_id != OMIT
      @amount_money = amount_money
      @reason = reason
      @device_id = device_id
      @deadline_duration = deadline_duration if deadline_duration != OMIT
      @status = status if status != OMIT
      @cancel_reason = cancel_reason if cancel_reason != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @app_id = app_id if app_id != OMIT
      @location_id = location_id if location_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "refund_id": refund_id, "payment_id": payment_id, "order_id": order_id, "amount_money": amount_money, "reason": reason, "device_id": device_id, "deadline_duration": deadline_duration, "status": status, "cancel_reason": cancel_reason, "created_at": created_at, "updated_at": updated_at, "app_id": app_id, "location_id": location_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TerminalRefund
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TerminalRefund]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      refund_id = parsed_json["refund_id"]
      payment_id = parsed_json["payment_id"]
      order_id = parsed_json["order_id"]
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = SquareApiClient::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      reason = parsed_json["reason"]
      device_id = parsed_json["device_id"]
      deadline_duration = parsed_json["deadline_duration"]
      status = parsed_json["status"]
      cancel_reason = parsed_json["cancel_reason"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      app_id = parsed_json["app_id"]
      location_id = parsed_json["location_id"]
      new(
        id: id,
        refund_id: refund_id,
        payment_id: payment_id,
        order_id: order_id,
        amount_money: amount_money,
        reason: reason,
        device_id: device_id,
        deadline_duration: deadline_duration,
        status: status,
        cancel_reason: cancel_reason,
        created_at: created_at,
        updated_at: updated_at,
        app_id: app_id,
        location_id: location_id,
        additional_properties: struct
      )
    end
# Serialize an instance of TerminalRefund to a JSON object
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
      obj.refund_id&.is_a?(String) != false || raise("Passed value for field obj.refund_id is not the expected type, validation failed.")
      obj.payment_id.is_a?(String) != false || raise("Passed value for field obj.payment_id is not the expected type, validation failed.")
      obj.order_id&.is_a?(String) != false || raise("Passed value for field obj.order_id is not the expected type, validation failed.")
      SquareApiClient::Money.validate_raw(obj: obj.amount_money)
      obj.reason.is_a?(String) != false || raise("Passed value for field obj.reason is not the expected type, validation failed.")
      obj.device_id.is_a?(String) != false || raise("Passed value for field obj.device_id is not the expected type, validation failed.")
      obj.deadline_duration&.is_a?(String) != false || raise("Passed value for field obj.deadline_duration is not the expected type, validation failed.")
      obj.status&.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.cancel_reason&.is_a?(SquareApiClient::ActionCancelReason) != false || raise("Passed value for field obj.cancel_reason is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.app_id&.is_a?(String) != false || raise("Passed value for field obj.app_id is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
    end
  end
end