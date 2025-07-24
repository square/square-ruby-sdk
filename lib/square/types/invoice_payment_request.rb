# frozen_string_literal: true
require_relative "invoice_request_method"
require_relative "invoice_request_type"
require_relative "money"
require_relative "invoice_automatic_payment_source"
require_relative "invoice_payment_reminder"
require "ostruct"
require "json"

module square.rb
# Represents a payment request for an [invoice](entity:Invoice). Invoices can
#  specify a maximum
#  of 13 payment requests, with up to 12 `INSTALLMENT` request types. For more
#  information,
#  see [Configuring payment
#  eloper.squareup.com/docs/invoices-api/create-publish-invoices#payment-requests).
#  Adding `INSTALLMENT` payment requests to an invoice requires an
#  [Invoices Plus
#  //developer.squareup.com/docs/invoices-api/overview#invoices-plus-subscription).
  class InvoicePaymentRequest
  # @return [String] The Square-generated ID of the payment request in an [invoice](entity:Invoice).
    attr_reader :uid
  # @return [square.rb::InvoiceRequestMethod] Indicates how Square processes the payment request. DEPRECATED at version
#  2021-01-21. Replaced by the
#  `Invoice.delivery_method` and `InvoicePaymentRequest.automatic_payment_source`
#  fields.
#  One of the following is required when creating an invoice:
#  - (Recommended) The `delivery_method` field of the invoice. To configure an
#  automatic payment, the
#  `automatic_payment_source` field of the payment request is also required.
#  - This `request_method` field. Note that `invoice` objects returned in responses
#  do not include `request_method`.
#  See [InvoiceRequestMethod](#type-invoicerequestmethod) for possible values
    attr_reader :request_method
  # @return [square.rb::InvoiceRequestType] Identifies the payment request type. This type defines how the payment request
#  amount is determined.
#  This field is required to create a payment request.
#  See [InvoiceRequestType](#type-invoicerequesttype) for possible values
    attr_reader :request_type
  # @return [String] The due date (in the invoice's time zone) for the payment request, in
#  `YYYY-MM-DD` format. This field
#  is required to create a payment request. If an `automatic_payment_source` is
#  defined for the request, Square
#  charges the payment source on this date.
#  After this date, the invoice becomes overdue. For example, a payment `due_date`
#  of 2021-03-09 with a `timezone`
#  of America/Los\_Angeles becomes overdue at midnight on March 9 in
#  America/Los\_Angeles (which equals a UTC
#  timestamp of 2021-03-10T08:00:00Z).
    attr_reader :due_date
  # @return [square.rb::Money] If the payment request specifies `DEPOSIT` or `INSTALLMENT` as the
#  `request_type`,
#  this indicates the request amount.
#  You cannot specify this when `request_type` is `BALANCE` or when the
#  payment request includes the `percentage_requested` field.
    attr_reader :fixed_amount_requested_money
  # @return [String] Specifies the amount for the payment request in percentage:
#  - When the payment `request_type` is `DEPOSIT`, it is the percentage of the
#  order's total amount.
#  - When the payment `request_type` is `INSTALLMENT`, it is the percentage of the
#  order's total less
#  the deposit, if requested. The sum of the `percentage_requested` in all
#  installment
#  payment requests must be equal to 100.
#  You cannot specify this when the payment `request_type` is `BALANCE` or when the
#  payment request specifies the `fixed_amount_requested_money` field.
    attr_reader :percentage_requested
  # @return [Boolean] If set to true, the Square-hosted invoice page (the `public_url` field of the
#  invoice)
#  provides a place for the customer to pay a tip.
#  This field is allowed only on the final payment request
#  and the payment `request_type` must be `BALANCE` or `INSTALLMENT`.
    attr_reader :tipping_enabled
  # @return [square.rb::InvoiceAutomaticPaymentSource] The payment method for an automatic payment.
#  The default value is `NONE`.
#  See [InvoiceAutomaticPaymentSource](#type-invoiceautomaticpaymentsource) for
#  possible values
    attr_reader :automatic_payment_source
  # @return [String] The ID of the credit or debit card on file to charge for the payment request. To
#  get the cards on file for a customer,
#  call [ListCards](api-endpoint:Cards-ListCards) and include the `customer_id` of
#  the invoice recipient.
    attr_reader :card_id
  # @return [Array<square.rb::InvoicePaymentReminder>] A list of one or more reminders to send for the payment request.
    attr_reader :reminders
  # @return [square.rb::Money] The amount of the payment request, computed using the order amount and
#  information from the various payment
#  request fields (`request_type`, `fixed_amount_requested_money`, and
#  `percentage_requested`).
    attr_reader :computed_amount_money
  # @return [square.rb::Money] The amount of money already paid for the specific payment request.
#  This amount might include a rounding adjustment if the most recent invoice
#  payment
#  was in cash in a currency that rounds cash payments (such as, `CAD` or `AUD`).
    attr_reader :total_completed_amount_money
  # @return [square.rb::Money] If the most recent payment was a cash payment
#  in a currency that rounds cash payments (such as, `CAD` or `AUD`) and the
#  payment
#  is rounded from `computed_amount_money` in the payment request, then this
#  field specifies the rounding adjustment applied. This amount
#  might be negative.
    attr_reader :rounding_adjustment_included_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] The Square-generated ID of the payment request in an [invoice](entity:Invoice).
    # @param request_method [square.rb::InvoiceRequestMethod] Indicates how Square processes the payment request. DEPRECATED at version
#  2021-01-21. Replaced by the
#  `Invoice.delivery_method` and `InvoicePaymentRequest.automatic_payment_source`
#  fields.
#  One of the following is required when creating an invoice:
#  - (Recommended) The `delivery_method` field of the invoice. To configure an
#  automatic payment, the
#  `automatic_payment_source` field of the payment request is also required.
#  - This `request_method` field. Note that `invoice` objects returned in responses
#  do not include `request_method`.
#  See [InvoiceRequestMethod](#type-invoicerequestmethod) for possible values
    # @param request_type [square.rb::InvoiceRequestType] Identifies the payment request type. This type defines how the payment request
#  amount is determined.
#  This field is required to create a payment request.
#  See [InvoiceRequestType](#type-invoicerequesttype) for possible values
    # @param due_date [String] The due date (in the invoice's time zone) for the payment request, in
#  `YYYY-MM-DD` format. This field
#  is required to create a payment request. If an `automatic_payment_source` is
#  defined for the request, Square
#  charges the payment source on this date.
#  After this date, the invoice becomes overdue. For example, a payment `due_date`
#  of 2021-03-09 with a `timezone`
#  of America/Los\_Angeles becomes overdue at midnight on March 9 in
#  America/Los\_Angeles (which equals a UTC
#  timestamp of 2021-03-10T08:00:00Z).
    # @param fixed_amount_requested_money [square.rb::Money] If the payment request specifies `DEPOSIT` or `INSTALLMENT` as the
#  `request_type`,
#  this indicates the request amount.
#  You cannot specify this when `request_type` is `BALANCE` or when the
#  payment request includes the `percentage_requested` field.
    # @param percentage_requested [String] Specifies the amount for the payment request in percentage:
#  - When the payment `request_type` is `DEPOSIT`, it is the percentage of the
#  order's total amount.
#  - When the payment `request_type` is `INSTALLMENT`, it is the percentage of the
#  order's total less
#  the deposit, if requested. The sum of the `percentage_requested` in all
#  installment
#  payment requests must be equal to 100.
#  You cannot specify this when the payment `request_type` is `BALANCE` or when the
#  payment request specifies the `fixed_amount_requested_money` field.
    # @param tipping_enabled [Boolean] If set to true, the Square-hosted invoice page (the `public_url` field of the
#  invoice)
#  provides a place for the customer to pay a tip.
#  This field is allowed only on the final payment request
#  and the payment `request_type` must be `BALANCE` or `INSTALLMENT`.
    # @param automatic_payment_source [square.rb::InvoiceAutomaticPaymentSource] The payment method for an automatic payment.
#  The default value is `NONE`.
#  See [InvoiceAutomaticPaymentSource](#type-invoiceautomaticpaymentsource) for
#  possible values
    # @param card_id [String] The ID of the credit or debit card on file to charge for the payment request. To
#  get the cards on file for a customer,
#  call [ListCards](api-endpoint:Cards-ListCards) and include the `customer_id` of
#  the invoice recipient.
    # @param reminders [Array<square.rb::InvoicePaymentReminder>] A list of one or more reminders to send for the payment request.
    # @param computed_amount_money [square.rb::Money] The amount of the payment request, computed using the order amount and
#  information from the various payment
#  request fields (`request_type`, `fixed_amount_requested_money`, and
#  `percentage_requested`).
    # @param total_completed_amount_money [square.rb::Money] The amount of money already paid for the specific payment request.
#  This amount might include a rounding adjustment if the most recent invoice
#  payment
#  was in cash in a currency that rounds cash payments (such as, `CAD` or `AUD`).
    # @param rounding_adjustment_included_money [square.rb::Money] If the most recent payment was a cash payment
#  in a currency that rounds cash payments (such as, `CAD` or `AUD`) and the
#  payment
#  is rounded from `computed_amount_money` in the payment request, then this
#  field specifies the rounding adjustment applied. This amount
#  might be negative.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::InvoicePaymentRequest]
    def initialize(uid: OMIT, request_method: OMIT, request_type: OMIT, due_date: OMIT, fixed_amount_requested_money: OMIT, percentage_requested: OMIT, tipping_enabled: OMIT, automatic_payment_source: OMIT, card_id: OMIT, reminders: OMIT, computed_amount_money: OMIT, total_completed_amount_money: OMIT, rounding_adjustment_included_money: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @request_method = request_method if request_method != OMIT
      @request_type = request_type if request_type != OMIT
      @due_date = due_date if due_date != OMIT
      @fixed_amount_requested_money = fixed_amount_requested_money if fixed_amount_requested_money != OMIT
      @percentage_requested = percentage_requested if percentage_requested != OMIT
      @tipping_enabled = tipping_enabled if tipping_enabled != OMIT
      @automatic_payment_source = automatic_payment_source if automatic_payment_source != OMIT
      @card_id = card_id if card_id != OMIT
      @reminders = reminders if reminders != OMIT
      @computed_amount_money = computed_amount_money if computed_amount_money != OMIT
      @total_completed_amount_money = total_completed_amount_money if total_completed_amount_money != OMIT
      @rounding_adjustment_included_money = rounding_adjustment_included_money if rounding_adjustment_included_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "request_method": request_method, "request_type": request_type, "due_date": due_date, "fixed_amount_requested_money": fixed_amount_requested_money, "percentage_requested": percentage_requested, "tipping_enabled": tipping_enabled, "automatic_payment_source": automatic_payment_source, "card_id": card_id, "reminders": reminders, "computed_amount_money": computed_amount_money, "total_completed_amount_money": total_completed_amount_money, "rounding_adjustment_included_money": rounding_adjustment_included_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InvoicePaymentRequest
    #
    # @param json_object [String] 
    # @return [square.rb::InvoicePaymentRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      request_method = parsed_json["request_method"]
      request_type = parsed_json["request_type"]
      due_date = parsed_json["due_date"]
      unless parsed_json["fixed_amount_requested_money"].nil?
        fixed_amount_requested_money = parsed_json["fixed_amount_requested_money"].to_json
        fixed_amount_requested_money = square.rb::Money.from_json(json_object: fixed_amount_requested_money)
      else
        fixed_amount_requested_money = nil
      end
      percentage_requested = parsed_json["percentage_requested"]
      tipping_enabled = parsed_json["tipping_enabled"]
      automatic_payment_source = parsed_json["automatic_payment_source"]
      card_id = parsed_json["card_id"]
      reminders = parsed_json["reminders"]&.map do | item |
  item = item.to_json
  square.rb::InvoicePaymentReminder.from_json(json_object: item)
end
      unless parsed_json["computed_amount_money"].nil?
        computed_amount_money = parsed_json["computed_amount_money"].to_json
        computed_amount_money = square.rb::Money.from_json(json_object: computed_amount_money)
      else
        computed_amount_money = nil
      end
      unless parsed_json["total_completed_amount_money"].nil?
        total_completed_amount_money = parsed_json["total_completed_amount_money"].to_json
        total_completed_amount_money = square.rb::Money.from_json(json_object: total_completed_amount_money)
      else
        total_completed_amount_money = nil
      end
      unless parsed_json["rounding_adjustment_included_money"].nil?
        rounding_adjustment_included_money = parsed_json["rounding_adjustment_included_money"].to_json
        rounding_adjustment_included_money = square.rb::Money.from_json(json_object: rounding_adjustment_included_money)
      else
        rounding_adjustment_included_money = nil
      end
      new(
        uid: uid,
        request_method: request_method,
        request_type: request_type,
        due_date: due_date,
        fixed_amount_requested_money: fixed_amount_requested_money,
        percentage_requested: percentage_requested,
        tipping_enabled: tipping_enabled,
        automatic_payment_source: automatic_payment_source,
        card_id: card_id,
        reminders: reminders,
        computed_amount_money: computed_amount_money,
        total_completed_amount_money: total_completed_amount_money,
        rounding_adjustment_included_money: rounding_adjustment_included_money,
        additional_properties: struct
      )
    end
# Serialize an instance of InvoicePaymentRequest to a JSON object
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
      obj.request_method&.is_a?(square.rb::InvoiceRequestMethod) != false || raise("Passed value for field obj.request_method is not the expected type, validation failed.")
      obj.request_type&.is_a?(square.rb::InvoiceRequestType) != false || raise("Passed value for field obj.request_type is not the expected type, validation failed.")
      obj.due_date&.is_a?(String) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
      obj.fixed_amount_requested_money.nil? || square.rb::Money.validate_raw(obj: obj.fixed_amount_requested_money)
      obj.percentage_requested&.is_a?(String) != false || raise("Passed value for field obj.percentage_requested is not the expected type, validation failed.")
      obj.tipping_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.tipping_enabled is not the expected type, validation failed.")
      obj.automatic_payment_source&.is_a?(square.rb::InvoiceAutomaticPaymentSource) != false || raise("Passed value for field obj.automatic_payment_source is not the expected type, validation failed.")
      obj.card_id&.is_a?(String) != false || raise("Passed value for field obj.card_id is not the expected type, validation failed.")
      obj.reminders&.is_a?(Array) != false || raise("Passed value for field obj.reminders is not the expected type, validation failed.")
      obj.computed_amount_money.nil? || square.rb::Money.validate_raw(obj: obj.computed_amount_money)
      obj.total_completed_amount_money.nil? || square.rb::Money.validate_raw(obj: obj.total_completed_amount_money)
      obj.rounding_adjustment_included_money.nil? || square.rb::Money.validate_raw(obj: obj.rounding_adjustment_included_money)
    end
  end
end