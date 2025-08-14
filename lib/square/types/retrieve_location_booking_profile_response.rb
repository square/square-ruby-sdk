# frozen_string_literal: true

module Square
    module Types
        class RetrieveLocationBookingProfileResponse < Square::Internal::Types::Model
            field :location_booking_profile, Square::LocationBookingProfile, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
