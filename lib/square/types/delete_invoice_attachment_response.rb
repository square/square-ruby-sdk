# frozen_string_literal: true

module Square
  module Types
    # Represents a [DeleteInvoiceAttachment](api-endpoint:Invoices-DeleteInvoiceAttachment) response.
    class DeleteInvoiceAttachmentResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

    end
  end
end
