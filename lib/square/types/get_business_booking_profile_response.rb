# frozen_string_literal: true

module Square
    module Types
        class GetBusinessBookingProfileResponse < Square::Internal::Types::Model
            field :business_booking_profile, Square::BusinessBookingProfile, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
