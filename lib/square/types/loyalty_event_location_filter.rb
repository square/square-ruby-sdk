# frozen_string_literal: true

module Square
  module Types
    # Filter events by location.
    class LoyaltyEventLocationFilter < Internal::Types::Model
      field :location_ids, Internal::Types::Array[String], optional: false, nullable: false

    end
  end
end
