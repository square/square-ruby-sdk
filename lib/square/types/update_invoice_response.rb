# frozen_string_literal: true

module Square
  module Types
    # Describes a `UpdateInvoice` response.
    class UpdateInvoiceResponse < Internal::Types::Model
      field :invoice, -> { Square::Types::Invoice }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
