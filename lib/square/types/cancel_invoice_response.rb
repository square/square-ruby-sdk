# frozen_string_literal: true

module Square
  module Types
    # The response returned by the `CancelInvoice` request.
    class CancelInvoiceResponse < Internal::Types::Model
      field :invoice, -> { Square::Types::Invoice }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
