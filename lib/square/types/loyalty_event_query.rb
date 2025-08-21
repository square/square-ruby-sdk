# frozen_string_literal: true

module Square
  module Types
    # Represents a query used to search for loyalty events.
    class LoyaltyEventQuery < Internal::Types::Model
      field :filter, -> { Square::Types::LoyaltyEventFilter }, optional: true, nullable: false
    end
  end
end
