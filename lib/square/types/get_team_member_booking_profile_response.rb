# frozen_string_literal: true

module Square
  module Types
    class GetTeamMemberBookingProfileResponse < Internal::Types::Model
      field :team_member_booking_profile, -> { Square::Types::TeamMemberBookingProfile }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
