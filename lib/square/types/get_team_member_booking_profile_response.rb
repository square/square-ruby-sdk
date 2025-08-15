# frozen_string_literal: true

module Square
  class GetTeamMemberBookingProfileResponse < Internal::Types::Model
    field :team_member_booking_profile, Square::TeamMemberBookingProfile, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
