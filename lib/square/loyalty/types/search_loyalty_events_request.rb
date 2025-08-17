
module Square
  module Loyalty
    module Types
      class SearchLoyaltyEventsRequest < Internal::Types::Model
        field :query, Square::Types::LoyaltyEventQuery, optional: true, nullable: false
        field :limit, Integer, optional: true, nullable: false
        field :cursor, String, optional: true, nullable: false

      end
    end
  end
end
