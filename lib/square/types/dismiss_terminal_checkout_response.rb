# frozen_string_literal: true

module Square
  module Types
    class DismissTerminalCheckoutResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :checkout, Square::TerminalCheckout, optional: true, nullable: false

    end
  end
end
