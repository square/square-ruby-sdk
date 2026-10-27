# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a payment request for an [invoice](entity:Invoice). Invoices can specify a maximum
    # of 13 payment requests, with up to 12 `INSTALLMENT` request types. For more information,
    # see [Configuring payment
    # requests](https://developer.squareup.com/docs/invoices-api/create-publish-invoices#payment-requests).
    #
    # Adding `INSTALLMENT` payment requests to an invoice requires an
    # [Invoices Plus
    # subscription](https://developer.squareup.com/docs/invoices-api/overview#invoices-plus-subscription).
    class InvoicePaymentRequest < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :request_method, -> { Square::Types::InvoiceRequestMethod }, optional: true, nullable: false

      field :request_type, -> { Square::Types::InvoiceRequestType }, optional: true, nullable: false

      field :due_date, -> { String }, optional: true, nullable: true

      field :fixed_amount_requested_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :percentage_requested, -> { String }, optional: true, nullable: true

      field :tipping_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :automatic_payment_source, -> { Square::Types::InvoiceAutomaticPaymentSource }, optional: true, nullable: false

      field :card_id, -> { String }, optional: true, nullable: true

      field :reminders, -> { Internal::Types::Array[Square::Types::InvoicePaymentReminder] }, optional: true, nullable: true

      field :computed_amount_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :total_completed_amount_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :rounding_adjustment_included_money, -> { Square::Types::Money }, optional: true, nullable: false
    end
  end
end
