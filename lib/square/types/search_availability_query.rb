# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The query used to search for buyer-accessible availabilities of bookings.
    class SearchAvailabilityQuery < Internal::Types::Model
      field :filter, -> { Square::Types::SearchAvailabilityFilter }, optional: false, nullable: false
    end
  end
end
