
module Square
  module Terminal
    module Checkouts
      module Types
        class CreateTerminalCheckoutRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false
          field :checkout, -> { Square::Types::TerminalCheckout }, optional: false, nullable: false

        end
      end
    end
  end
end
