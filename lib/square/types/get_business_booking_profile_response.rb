# frozen_string_literal: true

module Square
  class GetBusinessBookingProfileResponse < Internal::Types::Model
    field :business_booking_profile, Square::BusinessBookingProfile, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
