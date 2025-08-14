# frozen_string_literal: true

module Square
    module Types
        # Represents a [CreateInvoiceAttachment](api-endpoint:Invoices-CreateInvoiceAttachment) request.
        class CreateInvoiceAttachmentRequestData < Internal::Types::Model
            field :idempotency_key, String, optional: true, nullable: false
            field :description, String, optional: true, nullable: false
        end
    end
end
