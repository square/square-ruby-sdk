# frozen_string_literal: true

module Square
    module Types
        # Represents a [CreateInvoiceAttachment](api-endpoint:Invoices-CreateInvoiceAttachment) response.
        class CreateInvoiceAttachmentResponse < Square::Internal::Types::Model
            field :attachment, Square::InvoiceAttachment, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
