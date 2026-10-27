# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when a payment that is associated with an [invoice](entity:Invoice) is completed.
    # For more information about invoice payments, see [Pay an
    # invoice](https://developer.squareup.com/docs/invoices-api/pay-refund-invoices#pay-invoice).
    class InvoicePaymentMadeEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::InvoicePaymentMadeEventData }, optional: true, nullable: false
    end
  end
end
