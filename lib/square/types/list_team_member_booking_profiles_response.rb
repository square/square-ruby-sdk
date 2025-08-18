# frozen_string_literal: true

module Square
  module Types
    class ListTeamMemberBookingProfilesResponse < Internal::Types::Model
      field :team_member_booking_profiles, -> { Internal::Types::Array[Square::Types::TeamMemberBookingProfile] }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
