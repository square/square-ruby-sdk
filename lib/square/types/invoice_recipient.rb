# frozen_string_literal: true

module Square
  module Types
    # Represents a snapshot of customer data. This object stores customer data that is displayed on the invoice 
    # and that Square uses to deliver the invoice.
    # 
    # When you provide a customer ID for a draft invoice, Square retrieves the associated customer profile and populates 
    # the remaining `InvoiceRecipient` fields. You cannot update these fields after the invoice is published. 
    # Square updates the customer ID in response to a merge operation, but does not update other fields.
    class InvoiceRecipient < Internal::Types::Model
      field :customer_id, String, optional: true, nullable: false
      field :given_name, String, optional: true, nullable: false
      field :family_name, String, optional: true, nullable: false
      field :email_address, String, optional: true, nullable: false
      field :address, Square::Types::Address, optional: true, nullable: false
      field :phone_number, String, optional: true, nullable: false
      field :company_name, String, optional: true, nullable: false
      field :tax_ids, Square::Types::InvoiceRecipientTaxIds, optional: true, nullable: false

    end
  end
end
