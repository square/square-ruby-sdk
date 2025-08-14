# frozen_string_literal: true

module Square
    module Types
        class RetrieveLocationBookingProfileResponse < Internal::Types::Model
            field :location_booking_profile, Square::LocationBookingProfile, optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
