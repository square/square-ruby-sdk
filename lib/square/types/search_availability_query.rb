# frozen_string_literal: true

module Square
  module Types
    # The query used to search for buyer-accessible availabilities of bookings.
    class SearchAvailabilityQuery < Internal::Types::Model
      field :filter, Square::SearchAvailabilityFilter, optional: false, nullable: false

    end
  end
end
