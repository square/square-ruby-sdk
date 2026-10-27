# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class InvoicePaymentMadeEventObject < Internal::Types::Model
      field :invoice, -> { Square::Types::Invoice }, optional: true, nullable: false
    end
  end
end
