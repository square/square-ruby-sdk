# frozen_string_literal: true

module Square
    module Types
        # Response payload for the [BulkRetrieveTeamMemberBookingProfiles](api-endpoint:Bookings-BulkRetrieveTeamMemberBookingProfiles) endpoint.
        class BulkRetrieveTeamMemberBookingProfilesResponse < Square::Internal::Types::Model
            field :team_member_booking_profiles, Square::Internal::Types::Hash[String, Square::GetTeamMemberBookingProfileResponse], optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
