# frozen_string_literal: true

module Square
  module Invoices
    module Types
      class DeleteInvoiceAttachmentRequest < Internal::Types::Model
        field :invoice_id, -> { String }, optional: false, nullable: false
        field :attachment_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
