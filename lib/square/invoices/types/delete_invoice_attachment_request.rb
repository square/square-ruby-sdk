
module Square
  module Invoices
    class DeleteInvoiceAttachmentRequest
      field :invoice_id, String, optional: false, nullable: false
      field :attachment_id, String, optional: false, nullable: false

    end
  end
end
