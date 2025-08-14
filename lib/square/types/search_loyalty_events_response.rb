# frozen_string_literal: true

module Square
    module Types
        # A response that contains loyalty events that satisfy the search 
        # criteria, in order by the `created_at` date.
        class SearchLoyaltyEventsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :events, Square::Internal::Types::Array[Square::LoyaltyEvent], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
