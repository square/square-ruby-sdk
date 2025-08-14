# frozen_string_literal: true

module Square
    module Types
        # Represents a payment request for an [invoice](entity:Invoice). Invoices can specify a maximum
        # of 13 payment requests, with up to 12 `INSTALLMENT` request types. For more information, 
        # see [Configuring payment requests](https://developer.squareup.com/docs/invoices-api/create-publish-invoices#payment-requests).
        # 
        # Adding `INSTALLMENT` payment requests to an invoice requires an 
        # [Invoices Plus subscription](https://developer.squareup.com/docs/invoices-api/overview#invoices-plus-subscription).
        class InvoicePaymentRequest < Internal::Types::Model
            field :uid, String, optional: true, nullable: false
            field :request_method, Square::InvoiceRequestMethod, optional: true, nullable: false
            field :request_type, Square::InvoiceRequestType, optional: true, nullable: false
            field :due_date, String, optional: true, nullable: false
            field :fixed_amount_requested_money, Square::Money, optional: true, nullable: false
            field :percentage_requested, String, optional: true, nullable: false
            field :tipping_enabled, Internal::Types::Boolean, optional: true, nullable: false
            field :automatic_payment_source, Square::InvoiceAutomaticPaymentSource, optional: true, nullable: false
            field :card_id, String, optional: true, nullable: false
            field :reminders, Internal::Types::Array[Square::InvoicePaymentReminder], optional: true, nullable: false
            field :computed_amount_money, Square::Money, optional: true, nullable: false
            field :total_completed_amount_money, Square::Money, optional: true, nullable: false
            field :rounding_adjustment_included_money, Square::Money, optional: true, nullable: false
        end
    end
end
