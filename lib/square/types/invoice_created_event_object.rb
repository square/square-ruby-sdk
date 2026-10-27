# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class InvoiceCreatedEventObject < Internal::Types::Model
      field :invoice, -> { Square::Types::Invoice }, optional: true, nullable: false
    end
  end
end
