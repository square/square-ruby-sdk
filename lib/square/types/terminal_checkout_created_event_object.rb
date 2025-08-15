# frozen_string_literal: true

module Square
  class TerminalCheckoutCreatedEventObject < Internal::Types::Model
    field :checkout, Square::TerminalCheckout, optional: true, nullable: false

  end
end
