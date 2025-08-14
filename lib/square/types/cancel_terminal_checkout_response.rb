# frozen_string_literal: true

module Square
    module Types
        class CancelTerminalCheckoutResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :checkout, Square::TerminalCheckout, optional: true, nullable: false
        end
    end
end
