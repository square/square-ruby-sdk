# frozen_string_literal: true

module Square
  # Response payload for the [BulkRetrieveTeamMemberBookingProfiles](api-endpoint:Bookings-BulkRetrieveTeamMemberBookingProfiles) endpoint.
  class BulkRetrieveTeamMemberBookingProfilesResponse < Internal::Types::Model
    field :team_member_booking_profiles, Internal::Types::Hash[String, Square::GetTeamMemberBookingProfileResponse], optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
