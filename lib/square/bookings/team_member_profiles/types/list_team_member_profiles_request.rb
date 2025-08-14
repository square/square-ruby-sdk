
module Square
  module Bookings
    module TeamMemberProfiles
      class ListTeamMemberProfilesRequest
        field :bookable_only, Internal::Types::Boolean, optional: true, nullable: false
        field :limit, Integer, optional: true, nullable: false
        field :cursor, String, optional: true, nullable: false
        field :location_id, String, optional: true, nullable: false

      end
    end
  end
end
