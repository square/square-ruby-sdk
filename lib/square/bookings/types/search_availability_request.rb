
module Square
  module Bookings
    module Types
      class SearchAvailabilityRequest < Internal::Types::Model
        field :query, Square::Types::SearchAvailabilityQuery, optional: false, nullable: false

      end
    end
  end
end
