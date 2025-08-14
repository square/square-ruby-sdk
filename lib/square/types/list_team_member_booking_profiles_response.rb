# frozen_string_literal: true

module Square
    module Types
        class ListTeamMemberBookingProfilesResponse < Square::Internal::Types::Model
            field :team_member_booking_profiles, Square::Internal::Types::Array[Square::TeamMemberBookingProfile], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
