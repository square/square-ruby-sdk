# frozen_string_literal: true

module Square
  # Represents a query used to search for loyalty events.
  class LoyaltyEventQuery < Internal::Types::Model
    field :filter, Square::LoyaltyEventFilter, optional: true, nullable: false

  end
end
