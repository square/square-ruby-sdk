# frozen_string_literal: true

module Square
    module Types
        # Represents a query used to search for loyalty events.
        class LoyaltyEventQuery < Square::Internal::Types::Model
            field :filter, Square::LoyaltyEventFilter, optional: true, nullable: false
        end
    end
end
