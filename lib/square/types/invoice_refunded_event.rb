# frozen_string_literal: true

module Square
    module Types
        # Published when a refund is applied toward a payment of an [invoice](entity:Invoice). 
        # For more information about invoice refunds, see [Refund an invoice](https://developer.squareup.com/docs/invoices-api/pay-refund-invoices#refund-invoice).
        class InvoiceRefundedEvent < Square::Internal::Types::Model
            field :merchant_id, String, optional: true, nullable: false
            field :type, String, optional: true, nullable: false
            field :event_id, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :data, Square::InvoiceRefundedEventData, optional: true, nullable: false
        end
    end
end
