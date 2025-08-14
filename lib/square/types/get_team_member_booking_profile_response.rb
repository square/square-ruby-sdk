# frozen_string_literal: true

module Square
    module Types
        class GetTeamMemberBookingProfileResponse < Square::Internal::Types::Model
            field :team_member_booking_profile, Square::TeamMemberBookingProfile, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
