# frozen_string_literal: true

module Square
  module Types
    # A response that contains loyalty events that satisfy the search 
    # criteria, in order by the `created_at` date.
    class SearchLoyaltyEventsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :events, Internal::Types::Array[Square::Types::LoyaltyEvent], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false

    end
  end
end
