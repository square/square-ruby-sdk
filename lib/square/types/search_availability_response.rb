# frozen_string_literal: true

module Square
  class SearchAvailabilityResponse < Internal::Types::Model
    field :availabilities, Internal::Types::Array[Square::Availability], optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
