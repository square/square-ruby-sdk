# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Filter events by event type.
    class LoyaltyEventTypeFilter < Internal::Types::Model
      field :types, -> { Internal::Types::Array[Square::Types::LoyaltyEventType] }, optional: false, nullable: false
    end
  end
end
