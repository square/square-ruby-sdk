# frozen_string_literal: true

module Square
  class DismissTerminalCheckoutResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :checkout, Square::TerminalCheckout, optional: true, nullable: false

  end
end
