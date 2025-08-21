# frozen_string_literal: true

module Square
  module Types
    # Describes a `DeleteInvoice` response.
    class DeleteInvoiceResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
