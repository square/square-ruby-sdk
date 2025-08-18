# frozen_string_literal: true

module Square
  module Types
    class TerminalCheckoutUpdatedEventObject < Internal::Types::Model
      field :checkout, -> { Square::Types::TerminalCheckout }, optional: true, nullable: false

    end
  end
end
