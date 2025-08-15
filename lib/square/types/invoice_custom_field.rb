# frozen_string_literal: true

module Square
  # An additional seller-defined and customer-facing field to include on the invoice. For more information, 
  # see [Custom fields](https://developer.squareup.com/docs/invoices-api/overview#custom-fields).
  # 
  # Adding custom fields to an invoice requires an 
  # [Invoices Plus subscription](https://developer.squareup.com/docs/invoices-api/overview#invoices-plus-subscription).
  class InvoiceCustomField < Internal::Types::Model
    field :label, String, optional: true, nullable: false
    field :value, String, optional: true, nullable: false
    field :placement, Square::InvoiceCustomFieldPlacement, optional: true, nullable: false

  end
end
