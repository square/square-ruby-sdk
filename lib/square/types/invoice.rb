# frozen_string_literal: true
require_relative "invoice_recipient"
require_relative "invoice_payment_request"
require_relative "invoice_delivery_method"
require_relative "money"
require_relative "invoice_status"
require_relative "invoice_accepted_payment_methods"
require_relative "invoice_custom_field"
require_relative "invoice_attachment"
require "ostruct"
require "json"

module SquareApiClient
# Stores information about an invoice. You use the Invoices API to create and
#  manage
#  invoices. For more information, see [Invoices API
#  Overview](https://developer.squareup.com/docs/invoices-api/overview).
  class Invoice
  # @return [String] The Square-assigned ID of the invoice.
    attr_reader :id
  # @return [Integer] The Square-assigned version number, which is incremented each time an update is
#  committed to the invoice.
    attr_reader :version
  # @return [String] The ID of the location that this invoice is associated with.
#  If specified in a `CreateInvoice` request, the value must match the
#  `location_id` of the associated order.
    attr_reader :location_id
  # @return [String] The ID of the [order](entity:Order) for which the invoice is created.
#  This field is required when creating an invoice, and the order must be in the
#  `OPEN` state.
#  To view the line items and other information for the associated order, call the
#  [RetrieveOrder](api-endpoint:Orders-RetrieveOrder) endpoint using the order ID.
    attr_reader :order_id
  # @return [SquareApiClient::InvoiceRecipient] The customer who receives the invoice. This customer data is displayed on the
#  invoice and used by Square to deliver the invoice.
#  This field is required to publish an invoice, and it must specify the
#  `customer_id`.
    attr_reader :primary_recipient
  # @return [Array<SquareApiClient::InvoicePaymentRequest>] The payment schedule for the invoice, represented by one or more payment
#  requests that
#  define payment settings, such as amount due and due date. An invoice supports
#  the following payment request combinations:
#  - One balance
#  - One deposit with one balance
#  - 2–12 installments
#  - One deposit with 2–12 installments
#  This field is required when creating an invoice. It must contain at least one
#  payment request.
#  All payment requests for the invoice must equal the total order amount. For more
#  information, see
#  [Configuring payment
#  eloper.squareup.com/docs/invoices-api/create-publish-invoices#payment-requests).
#  Adding `INSTALLMENT` payment requests to an invoice requires an
#  [Invoices Plus
#  //developer.squareup.com/docs/invoices-api/overview#invoices-plus-subscription).
    attr_reader :payment_requests
  # @return [SquareApiClient::InvoiceDeliveryMethod] The delivery method that Square uses to send the invoice, reminders, and
#  receipts to
#  the customer. After the invoice is published, Square processes the invoice based
#  on the delivery
#  method and payment request settings, either immediately or on the `scheduled_at`
#  date, if specified.
#  For example, Square might send the invoice or receipt for an automatic payment.
#  For invoices with
#  automatic payments, this field must be set to `EMAIL`.
#  One of the following is required when creating an invoice:
#  - (Recommended) This `delivery_method` field. To configure an automatic payment,
#  the
#  `automatic_payment_source` field of the payment request is also required.
#  - The deprecated `request_method` field of the payment request. Note that
#  `invoice`
#  objects returned in responses do not include `request_method`.
#  See [InvoiceDeliveryMethod](#type-invoicedeliverymethod) for possible values
    attr_reader :delivery_method
  # @return [String] A user-friendly invoice number that is displayed on the invoice. The value is
#  unique within a location.
#  If not provided when creating an invoice, Square assigns a value.
#  It increments from 1 and is padded with zeros making it 7 characters long
#  (for example, 0000001 and 0000002).
    attr_reader :invoice_number
  # @return [String] The title of the invoice, which is displayed on the invoice.
    attr_reader :title
  # @return [String] The description of the invoice, which is displayed on the invoice.
    attr_reader :description
  # @return [String] The timestamp when the invoice is scheduled for processing, in RFC 3339 format.
#  After the invoice is published, Square processes the invoice on the specified
#  date,
#  according to the delivery method and payment request settings.
#  If the field is not set, Square processes the invoice immediately after it is
#  published.
    attr_reader :scheduled_at
  # @return [String] A temporary link to the Square-hosted payment page where the customer can pay
#  the
#  invoice. If the link expires, customers can provide the email address or phone
#  number
#  associated with the invoice and request a new link directly from the expired
#  payment page.
#  This field is added after the invoice is published and reaches the scheduled
#  date
#  (if one is defined).
    attr_reader :public_url
  # @return [SquareApiClient::Money] The current amount due for the invoice. In addition to the
#  amount due on the next payment request, this includes any overdue payment
#  amounts.
    attr_reader :next_payment_amount_money
  # @return [SquareApiClient::InvoiceStatus] The status of the invoice.
#  See [InvoiceStatus](#type-invoicestatus) for possible values
    attr_reader :status
  # @return [String] The time zone used to interpret calendar dates on the invoice, such as
#  `due_date`.
#  When an invoice is created, this field is set to the `timezone` specified for
#  the seller
#  location. The value cannot be changed.
#  For example, a payment `due_date` of 2021-03-09 with a `timezone` of
#  America/Los\_Angeles
#  becomes overdue at midnight on March 9 in America/Los\_Angeles (which equals a
#  UTC timestamp
#  of 2021-03-10T08:00:00Z).
    attr_reader :timezone
  # @return [String] The timestamp when the invoice was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The timestamp when the invoice was last updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [SquareApiClient::InvoiceAcceptedPaymentMethods] The payment methods that customers can use to pay the invoice on the
#  Square-hosted
#  invoice page. This setting is independent of any automatic payment requests for
#  the invoice.
#  This field is required when creating an invoice and must set at least one
#  payment method to `true`.
    attr_reader :accepted_payment_methods
  # @return [Array<SquareApiClient::InvoiceCustomField>] Additional seller-defined fields that are displayed on the invoice. For more
#  information, see
#  [Custom
#  ields](https://developer.squareup.com/docs/invoices-api/overview#custom-fields).
#  Adding custom fields to an invoice requires an
#  [Invoices Plus
#  //developer.squareup.com/docs/invoices-api/overview#invoices-plus-subscription).
#  Max: 2 custom fields
    attr_reader :custom_fields
  # @return [String] The ID of the [subscription](entity:Subscription) associated with the invoice.
#  This field is present only on subscription billing invoices.
    attr_reader :subscription_id
  # @return [String] The date of the sale or the date that the service is rendered, in `YYYY-MM-DD`
#  format.
#  This field can be used to specify a past or future date which is displayed on
#  the invoice.
    attr_reader :sale_or_service_date
  # @return [String] **France only.** The payment terms and conditions that are displayed on the
#  invoice. For more information,
#  see [Payment
#  ](https://developer.squareup.com/docs/invoices-api/overview#payment-conditions).
#  For countries other than France, Square returns an `INVALID_REQUEST_ERROR` with
#  a `BAD_REQUEST` code and
#  "Payment conditions are not supported for this location's country" detail if
#  this field is included in `CreateInvoice` or `UpdateInvoice` requests.
    attr_reader :payment_conditions
  # @return [Boolean] Indicates whether to allow a customer to save a credit or debit card as a card
#  on file or a bank transfer as a
#  bank account on file. If `true`, Square displays a __Save my card on file__ or
#  __Save my bank on file__ checkbox on the
#  invoice payment page. Stored payment information can be used for future
#  automatic payments. The default value is `false`.
    attr_reader :store_payment_method_enabled
  # @return [Array<SquareApiClient::InvoiceAttachment>] Metadata about the attachments on the invoice. Invoice attachments are managed
#  using the
#  [CreateInvoiceAttachment](api-endpoint:Invoices-CreateInvoiceAttachment) and
#  [DeleteInvoiceAttachment](api-endpoint:Invoices-DeleteInvoiceAttachment)
#  endpoints.
    attr_reader :attachments
  # @return [String] The ID of the [team member](entity:TeamMember) who created the invoice.
#  This field is present only on invoices created in the Square Dashboard or Square
#  Invoices app by a logged-in team member.
    attr_reader :creator_team_member_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID of the invoice.
    # @param version [Integer] The Square-assigned version number, which is incremented each time an update is
#  committed to the invoice.
    # @param location_id [String] The ID of the location that this invoice is associated with.
#  If specified in a `CreateInvoice` request, the value must match the
#  `location_id` of the associated order.
    # @param order_id [String] The ID of the [order](entity:Order) for which the invoice is created.
#  This field is required when creating an invoice, and the order must be in the
#  `OPEN` state.
#  To view the line items and other information for the associated order, call the
#  [RetrieveOrder](api-endpoint:Orders-RetrieveOrder) endpoint using the order ID.
    # @param primary_recipient [SquareApiClient::InvoiceRecipient] The customer who receives the invoice. This customer data is displayed on the
#  invoice and used by Square to deliver the invoice.
#  This field is required to publish an invoice, and it must specify the
#  `customer_id`.
    # @param payment_requests [Array<SquareApiClient::InvoicePaymentRequest>] The payment schedule for the invoice, represented by one or more payment
#  requests that
#  define payment settings, such as amount due and due date. An invoice supports
#  the following payment request combinations:
#  - One balance
#  - One deposit with one balance
#  - 2–12 installments
#  - One deposit with 2–12 installments
#  This field is required when creating an invoice. It must contain at least one
#  payment request.
#  All payment requests for the invoice must equal the total order amount. For more
#  information, see
#  [Configuring payment
#  eloper.squareup.com/docs/invoices-api/create-publish-invoices#payment-requests).
#  Adding `INSTALLMENT` payment requests to an invoice requires an
#  [Invoices Plus
#  //developer.squareup.com/docs/invoices-api/overview#invoices-plus-subscription).
    # @param delivery_method [SquareApiClient::InvoiceDeliveryMethod] The delivery method that Square uses to send the invoice, reminders, and
#  receipts to
#  the customer. After the invoice is published, Square processes the invoice based
#  on the delivery
#  method and payment request settings, either immediately or on the `scheduled_at`
#  date, if specified.
#  For example, Square might send the invoice or receipt for an automatic payment.
#  For invoices with
#  automatic payments, this field must be set to `EMAIL`.
#  One of the following is required when creating an invoice:
#  - (Recommended) This `delivery_method` field. To configure an automatic payment,
#  the
#  `automatic_payment_source` field of the payment request is also required.
#  - The deprecated `request_method` field of the payment request. Note that
#  `invoice`
#  objects returned in responses do not include `request_method`.
#  See [InvoiceDeliveryMethod](#type-invoicedeliverymethod) for possible values
    # @param invoice_number [String] A user-friendly invoice number that is displayed on the invoice. The value is
#  unique within a location.
#  If not provided when creating an invoice, Square assigns a value.
#  It increments from 1 and is padded with zeros making it 7 characters long
#  (for example, 0000001 and 0000002).
    # @param title [String] The title of the invoice, which is displayed on the invoice.
    # @param description [String] The description of the invoice, which is displayed on the invoice.
    # @param scheduled_at [String] The timestamp when the invoice is scheduled for processing, in RFC 3339 format.
#  After the invoice is published, Square processes the invoice on the specified
#  date,
#  according to the delivery method and payment request settings.
#  If the field is not set, Square processes the invoice immediately after it is
#  published.
    # @param public_url [String] A temporary link to the Square-hosted payment page where the customer can pay
#  the
#  invoice. If the link expires, customers can provide the email address or phone
#  number
#  associated with the invoice and request a new link directly from the expired
#  payment page.
#  This field is added after the invoice is published and reaches the scheduled
#  date
#  (if one is defined).
    # @param next_payment_amount_money [SquareApiClient::Money] The current amount due for the invoice. In addition to the
#  amount due on the next payment request, this includes any overdue payment
#  amounts.
    # @param status [SquareApiClient::InvoiceStatus] The status of the invoice.
#  See [InvoiceStatus](#type-invoicestatus) for possible values
    # @param timezone [String] The time zone used to interpret calendar dates on the invoice, such as
#  `due_date`.
#  When an invoice is created, this field is set to the `timezone` specified for
#  the seller
#  location. The value cannot be changed.
#  For example, a payment `due_date` of 2021-03-09 with a `timezone` of
#  America/Los\_Angeles
#  becomes overdue at midnight on March 9 in America/Los\_Angeles (which equals a
#  UTC timestamp
#  of 2021-03-10T08:00:00Z).
    # @param created_at [String] The timestamp when the invoice was created, in RFC 3339 format.
    # @param updated_at [String] The timestamp when the invoice was last updated, in RFC 3339 format.
    # @param accepted_payment_methods [SquareApiClient::InvoiceAcceptedPaymentMethods] The payment methods that customers can use to pay the invoice on the
#  Square-hosted
#  invoice page. This setting is independent of any automatic payment requests for
#  the invoice.
#  This field is required when creating an invoice and must set at least one
#  payment method to `true`.
    # @param custom_fields [Array<SquareApiClient::InvoiceCustomField>] Additional seller-defined fields that are displayed on the invoice. For more
#  information, see
#  [Custom
#  ields](https://developer.squareup.com/docs/invoices-api/overview#custom-fields).
#  Adding custom fields to an invoice requires an
#  [Invoices Plus
#  //developer.squareup.com/docs/invoices-api/overview#invoices-plus-subscription).
#  Max: 2 custom fields
    # @param subscription_id [String] The ID of the [subscription](entity:Subscription) associated with the invoice.
#  This field is present only on subscription billing invoices.
    # @param sale_or_service_date [String] The date of the sale or the date that the service is rendered, in `YYYY-MM-DD`
#  format.
#  This field can be used to specify a past or future date which is displayed on
#  the invoice.
    # @param payment_conditions [String] **France only.** The payment terms and conditions that are displayed on the
#  invoice. For more information,
#  see [Payment
#  ](https://developer.squareup.com/docs/invoices-api/overview#payment-conditions).
#  For countries other than France, Square returns an `INVALID_REQUEST_ERROR` with
#  a `BAD_REQUEST` code and
#  "Payment conditions are not supported for this location's country" detail if
#  this field is included in `CreateInvoice` or `UpdateInvoice` requests.
    # @param store_payment_method_enabled [Boolean] Indicates whether to allow a customer to save a credit or debit card as a card
#  on file or a bank transfer as a
#  bank account on file. If `true`, Square displays a __Save my card on file__ or
#  __Save my bank on file__ checkbox on the
#  invoice payment page. Stored payment information can be used for future
#  automatic payments. The default value is `false`.
    # @param attachments [Array<SquareApiClient::InvoiceAttachment>] Metadata about the attachments on the invoice. Invoice attachments are managed
#  using the
#  [CreateInvoiceAttachment](api-endpoint:Invoices-CreateInvoiceAttachment) and
#  [DeleteInvoiceAttachment](api-endpoint:Invoices-DeleteInvoiceAttachment)
#  endpoints.
    # @param creator_team_member_id [String] The ID of the [team member](entity:TeamMember) who created the invoice.
#  This field is present only on invoices created in the Square Dashboard or Square
#  Invoices app by a logged-in team member.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::Invoice]
    def initialize(id: OMIT, version: OMIT, location_id: OMIT, order_id: OMIT, primary_recipient: OMIT, payment_requests: OMIT, delivery_method: OMIT, invoice_number: OMIT, title: OMIT, description: OMIT, scheduled_at: OMIT, public_url: OMIT, next_payment_amount_money: OMIT, status: OMIT, timezone: OMIT, created_at: OMIT, updated_at: OMIT, accepted_payment_methods: OMIT, custom_fields: OMIT, subscription_id: OMIT, sale_or_service_date: OMIT, payment_conditions: OMIT, store_payment_method_enabled: OMIT, attachments: OMIT, creator_team_member_id: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @version = version if version != OMIT
      @location_id = location_id if location_id != OMIT
      @order_id = order_id if order_id != OMIT
      @primary_recipient = primary_recipient if primary_recipient != OMIT
      @payment_requests = payment_requests if payment_requests != OMIT
      @delivery_method = delivery_method if delivery_method != OMIT
      @invoice_number = invoice_number if invoice_number != OMIT
      @title = title if title != OMIT
      @description = description if description != OMIT
      @scheduled_at = scheduled_at if scheduled_at != OMIT
      @public_url = public_url if public_url != OMIT
      @next_payment_amount_money = next_payment_amount_money if next_payment_amount_money != OMIT
      @status = status if status != OMIT
      @timezone = timezone if timezone != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @accepted_payment_methods = accepted_payment_methods if accepted_payment_methods != OMIT
      @custom_fields = custom_fields if custom_fields != OMIT
      @subscription_id = subscription_id if subscription_id != OMIT
      @sale_or_service_date = sale_or_service_date if sale_or_service_date != OMIT
      @payment_conditions = payment_conditions if payment_conditions != OMIT
      @store_payment_method_enabled = store_payment_method_enabled if store_payment_method_enabled != OMIT
      @attachments = attachments if attachments != OMIT
      @creator_team_member_id = creator_team_member_id if creator_team_member_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "version": version, "location_id": location_id, "order_id": order_id, "primary_recipient": primary_recipient, "payment_requests": payment_requests, "delivery_method": delivery_method, "invoice_number": invoice_number, "title": title, "description": description, "scheduled_at": scheduled_at, "public_url": public_url, "next_payment_amount_money": next_payment_amount_money, "status": status, "timezone": timezone, "created_at": created_at, "updated_at": updated_at, "accepted_payment_methods": accepted_payment_methods, "custom_fields": custom_fields, "subscription_id": subscription_id, "sale_or_service_date": sale_or_service_date, "payment_conditions": payment_conditions, "store_payment_method_enabled": store_payment_method_enabled, "attachments": attachments, "creator_team_member_id": creator_team_member_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Invoice
    #
    # @param json_object [String] 
    # @return [SquareApiClient::Invoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      version = parsed_json["version"]
      location_id = parsed_json["location_id"]
      order_id = parsed_json["order_id"]
      unless parsed_json["primary_recipient"].nil?
        primary_recipient = parsed_json["primary_recipient"].to_json
        primary_recipient = SquareApiClient::InvoiceRecipient.from_json(json_object: primary_recipient)
      else
        primary_recipient = nil
      end
      payment_requests = parsed_json["payment_requests"]&.map do | item |
  item = item.to_json
  SquareApiClient::InvoicePaymentRequest.from_json(json_object: item)
end
      delivery_method = parsed_json["delivery_method"]
      invoice_number = parsed_json["invoice_number"]
      title = parsed_json["title"]
      description = parsed_json["description"]
      scheduled_at = parsed_json["scheduled_at"]
      public_url = parsed_json["public_url"]
      unless parsed_json["next_payment_amount_money"].nil?
        next_payment_amount_money = parsed_json["next_payment_amount_money"].to_json
        next_payment_amount_money = SquareApiClient::Money.from_json(json_object: next_payment_amount_money)
      else
        next_payment_amount_money = nil
      end
      status = parsed_json["status"]
      timezone = parsed_json["timezone"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      unless parsed_json["accepted_payment_methods"].nil?
        accepted_payment_methods = parsed_json["accepted_payment_methods"].to_json
        accepted_payment_methods = SquareApiClient::InvoiceAcceptedPaymentMethods.from_json(json_object: accepted_payment_methods)
      else
        accepted_payment_methods = nil
      end
      custom_fields = parsed_json["custom_fields"]&.map do | item |
  item = item.to_json
  SquareApiClient::InvoiceCustomField.from_json(json_object: item)
end
      subscription_id = parsed_json["subscription_id"]
      sale_or_service_date = parsed_json["sale_or_service_date"]
      payment_conditions = parsed_json["payment_conditions"]
      store_payment_method_enabled = parsed_json["store_payment_method_enabled"]
      attachments = parsed_json["attachments"]&.map do | item |
  item = item.to_json
  SquareApiClient::InvoiceAttachment.from_json(json_object: item)
end
      creator_team_member_id = parsed_json["creator_team_member_id"]
      new(
        id: id,
        version: version,
        location_id: location_id,
        order_id: order_id,
        primary_recipient: primary_recipient,
        payment_requests: payment_requests,
        delivery_method: delivery_method,
        invoice_number: invoice_number,
        title: title,
        description: description,
        scheduled_at: scheduled_at,
        public_url: public_url,
        next_payment_amount_money: next_payment_amount_money,
        status: status,
        timezone: timezone,
        created_at: created_at,
        updated_at: updated_at,
        accepted_payment_methods: accepted_payment_methods,
        custom_fields: custom_fields,
        subscription_id: subscription_id,
        sale_or_service_date: sale_or_service_date,
        payment_conditions: payment_conditions,
        store_payment_method_enabled: store_payment_method_enabled,
        attachments: attachments,
        creator_team_member_id: creator_team_member_id,
        additional_properties: struct
      )
    end
# Serialize an instance of Invoice to a JSON object
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
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.order_id&.is_a?(String) != false || raise("Passed value for field obj.order_id is not the expected type, validation failed.")
      obj.primary_recipient.nil? || SquareApiClient::InvoiceRecipient.validate_raw(obj: obj.primary_recipient)
      obj.payment_requests&.is_a?(Array) != false || raise("Passed value for field obj.payment_requests is not the expected type, validation failed.")
      obj.delivery_method&.is_a?(SquareApiClient::InvoiceDeliveryMethod) != false || raise("Passed value for field obj.delivery_method is not the expected type, validation failed.")
      obj.invoice_number&.is_a?(String) != false || raise("Passed value for field obj.invoice_number is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.scheduled_at&.is_a?(String) != false || raise("Passed value for field obj.scheduled_at is not the expected type, validation failed.")
      obj.public_url&.is_a?(String) != false || raise("Passed value for field obj.public_url is not the expected type, validation failed.")
      obj.next_payment_amount_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.next_payment_amount_money)
      obj.status&.is_a?(SquareApiClient::InvoiceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.timezone&.is_a?(String) != false || raise("Passed value for field obj.timezone is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.accepted_payment_methods.nil? || SquareApiClient::InvoiceAcceptedPaymentMethods.validate_raw(obj: obj.accepted_payment_methods)
      obj.custom_fields&.is_a?(Array) != false || raise("Passed value for field obj.custom_fields is not the expected type, validation failed.")
      obj.subscription_id&.is_a?(String) != false || raise("Passed value for field obj.subscription_id is not the expected type, validation failed.")
      obj.sale_or_service_date&.is_a?(String) != false || raise("Passed value for field obj.sale_or_service_date is not the expected type, validation failed.")
      obj.payment_conditions&.is_a?(String) != false || raise("Passed value for field obj.payment_conditions is not the expected type, validation failed.")
      obj.store_payment_method_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.store_payment_method_enabled is not the expected type, validation failed.")
      obj.attachments&.is_a?(Array) != false || raise("Passed value for field obj.attachments is not the expected type, validation failed.")
      obj.creator_team_member_id&.is_a?(String) != false || raise("Passed value for field obj.creator_team_member_id is not the expected type, validation failed.")
    end
  end
end