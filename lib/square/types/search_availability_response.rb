# frozen_string_literal: true

module Square
  module Types
    class SearchAvailabilityResponse < Internal::Types::Model
      field :availabilities, -> { Internal::Types::Array[Square::Types::Availability] }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
