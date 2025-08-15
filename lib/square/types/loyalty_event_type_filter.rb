# frozen_string_literal: true

module Square
  # Filter events by event type.
  class LoyaltyEventTypeFilter < Internal::Types::Model
    field :types, Internal::Types::Array[Square::LoyaltyEventType], optional: false, nullable: false

  end
end
