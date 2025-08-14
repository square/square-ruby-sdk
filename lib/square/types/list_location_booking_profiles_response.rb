# frozen_string_literal: true

module Square
    module Types
        class ListLocationBookingProfilesResponse < Square::Internal::Types::Model
            field :location_booking_profiles, Square::Internal::Types::Array[Square::LocationBookingProfile], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
