# frozen_string_literal: true

module Square
  class ListTeamMemberBookingProfilesResponse < Internal::Types::Model
    field :team_member_booking_profiles, Internal::Types::Array[Square::TeamMemberBookingProfile], optional: true, nullable: false
    field :cursor, String, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
