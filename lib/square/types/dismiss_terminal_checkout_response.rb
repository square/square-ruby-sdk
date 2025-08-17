# frozen_string_literal: true

module Square
  module Types
    class DismissTerminalCheckoutResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :checkout, Square::Types::TerminalCheckout, optional: true, nullable: false

    end
  end
end
