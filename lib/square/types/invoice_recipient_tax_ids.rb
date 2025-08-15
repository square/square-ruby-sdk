# frozen_string_literal: true

module Square
  # Represents the tax IDs for an invoice recipient. The country of the seller account determines 
  # whether the corresponding `tax_ids` field is available for the customer. For more information, 
  # see [Invoice recipient tax IDs](https://developer.squareup.com/docs/invoices-api/overview#recipient-tax-ids).
  class InvoiceRecipientTaxIds < Internal::Types::Model
    field :eu_vat, String, optional: true, nullable: false

  end
end
