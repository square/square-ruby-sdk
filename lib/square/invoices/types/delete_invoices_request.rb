# frozen_string_literal: true

module Square
  module Invoices
    module Types
      class DeleteInvoicesRequest < Internal::Types::Model
        field :invoice_id, -> { String }, optional: false, nullable: false
        field :version, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
