# frozen_string_literal: true

module Square
    module Types
        # Filter events by location.
        class LoyaltyEventLocationFilter < Square::Internal::Types::Model
            field :location_ids, Square::Internal::Types::Array[String], optional: false, nullable: false
        end
    end
end
