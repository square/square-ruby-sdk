# frozen_string_literal: true
require_relative "invoice_payment_reminder_status"
require "ostruct"
require "json"

module SquareApiClient
# Describes a payment request reminder (automatic notification) that Square sends
#  to the customer. You configure a reminder relative to the payment request
#  `due_date`.
  class InvoicePaymentReminder
  # @return [String] A Square-assigned ID that uniquely identifies the reminder within the
#  `InvoicePaymentRequest`.
    attr_reader :uid
  # @return [Integer] The number of days before (a negative number) or after (a positive number)
#  the payment request `due_date` when the reminder is sent. For example, -3
#  indicates that
#  the reminder should be sent 3 days before the payment request `due_date`.
    attr_reader :relative_scheduled_days
  # @return [String] The reminder message.
    attr_reader :message
  # @return [SquareApiClient::InvoicePaymentReminderStatus] The status of the reminder.
#  See [InvoicePaymentReminderStatus](#type-invoicepaymentreminderstatus) for
#  possible values
    attr_reader :status
  # @return [String] If sent, the timestamp when the reminder was sent, in RFC 3339 format.
    attr_reader :sent_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A Square-assigned ID that uniquely identifies the reminder within the
#  `InvoicePaymentRequest`.
    # @param relative_scheduled_days [Integer] The number of days before (a negative number) or after (a positive number)
#  the payment request `due_date` when the reminder is sent. For example, -3
#  indicates that
#  the reminder should be sent 3 days before the payment request `due_date`.
    # @param message [String] The reminder message.
    # @param status [SquareApiClient::InvoicePaymentReminderStatus] The status of the reminder.
#  See [InvoicePaymentReminderStatus](#type-invoicepaymentreminderstatus) for
#  possible values
    # @param sent_at [String] If sent, the timestamp when the reminder was sent, in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::InvoicePaymentReminder]
    def initialize(uid: OMIT, relative_scheduled_days: OMIT, message: OMIT, status: OMIT, sent_at: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @relative_scheduled_days = relative_scheduled_days if relative_scheduled_days != OMIT
      @message = message if message != OMIT
      @status = status if status != OMIT
      @sent_at = sent_at if sent_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "relative_scheduled_days": relative_scheduled_days, "message": message, "status": status, "sent_at": sent_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InvoicePaymentReminder
    #
    # @param json_object [String] 
    # @return [SquareApiClient::InvoicePaymentReminder]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      relative_scheduled_days = parsed_json["relative_scheduled_days"]
      message = parsed_json["message"]
      status = parsed_json["status"]
      sent_at = parsed_json["sent_at"]
      new(
        uid: uid,
        relative_scheduled_days: relative_scheduled_days,
        message: message,
        status: status,
        sent_at: sent_at,
        additional_properties: struct
      )
    end
# Serialize an instance of InvoicePaymentReminder to a JSON object
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
      obj.uid&.is_a?(String) != false || raise("Passed value for field obj.uid is not the expected type, validation failed.")
      obj.relative_scheduled_days&.is_a?(Integer) != false || raise("Passed value for field obj.relative_scheduled_days is not the expected type, validation failed.")
      obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.status&.is_a?(SquareApiClient::InvoicePaymentReminderStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.sent_at&.is_a?(String) != false || raise("Passed value for field obj.sent_at is not the expected type, validation failed.")
    end
  end
end