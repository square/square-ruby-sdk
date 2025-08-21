# frozen_string_literal: true

module Square
  module Types
    class InvoiceCanceledEventObject < Internal::Types::Model
      field :invoice, -> { Square::Types::Invoice }, optional: true, nullable: false
    end
  end
end
