# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class TerminalCheckoutUpdatedEventObject < Internal::Types::Model
      field :checkout, -> { Square::Types::TerminalCheckout }, optional: true, nullable: false
    end
  end
end
