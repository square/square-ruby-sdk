# frozen_string_literal: true

module Square
    module Types
        # Filter events by event type.
        class LoyaltyEventTypeFilter < Square::Internal::Types::Model
            field :types, Square::Internal::Types::Array[Square::LoyaltyEventType], optional: false, nullable: false
        end
    end
end
