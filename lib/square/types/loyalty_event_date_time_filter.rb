# frozen_string_literal: true

module Square
    module Types
        # Filter events by date time range.
        class LoyaltyEventDateTimeFilter < Internal::Types::Model
            field :created_at, Square::TimeRange, optional: false, nullable: false
        end
    end
end
