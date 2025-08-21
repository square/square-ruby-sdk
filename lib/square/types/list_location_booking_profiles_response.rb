# frozen_string_literal: true

module Square
  module Types
    class ListLocationBookingProfilesResponse < Internal::Types::Model
      field :location_booking_profiles, lambda {
        Internal::Types::Array[Square::Types::LocationBookingProfile]
      }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
