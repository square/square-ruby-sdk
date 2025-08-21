# frozen_string_literal: true

module Square
  module Terminal
    module Types
      class DismissTerminalCheckoutRequest < Internal::Types::Model
        field :checkout_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
