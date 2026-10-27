# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Stores information about an invoice. You use the Invoices API to create and manage
    # invoices. For more information, see [Invoices API
    # Overview](https://developer.squareup.com/docs/invoices-api/overview).
    class Invoice < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :version, -> { Integer }, optional: true, nullable: false

      field :location_id, -> { String }, optional: true, nullable: true

      field :order_id, -> { String }, optional: true, nullable: true

      field :primary_recipient, -> { Square::Types::InvoiceRecipient }, optional: true, nullable: false

      field :payment_requests, -> { Internal::Types::Array[Square::Types::InvoicePaymentRequest] }, optional: true, nullable: true

      field :delivery_method, -> { Square::Types::InvoiceDeliveryMethod }, optional: true, nullable: false

      field :invoice_number, -> { String }, optional: true, nullable: true

      field :title, -> { String }, optional: true, nullable: true

      field :description, -> { String }, optional: true, nullable: true

      field :scheduled_at, -> { String }, optional: true, nullable: true

      field :public_url, -> { String }, optional: true, nullable: false

      field :next_payment_amount_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :status, -> { Square::Types::InvoiceStatus }, optional: true, nullable: false

      field :timezone, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false

      field :accepted_payment_methods, -> { Square::Types::InvoiceAcceptedPaymentMethods }, optional: true, nullable: false

      field :custom_fields, -> { Internal::Types::Array[Square::Types::InvoiceCustomField] }, optional: true, nullable: true

      field :subscription_id, -> { String }, optional: true, nullable: false

      field :sale_or_service_date, -> { String }, optional: true, nullable: true

      field :payment_conditions, -> { String }, optional: true, nullable: true

      field :store_payment_method_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :attachments, -> { Internal::Types::Array[Square::Types::InvoiceAttachment] }, optional: true, nullable: false

      field :creator_team_member_id, -> { String }, optional: true, nullable: false
    end
  end
end
