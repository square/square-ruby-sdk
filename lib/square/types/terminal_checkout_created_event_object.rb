# frozen_string_literal: true

module Square
  module Types
    class TerminalCheckoutCreatedEventObject < Internal::Types::Model
      field :checkout, Square::TerminalCheckout, optional: true, nullable: false

    end
  end
end
