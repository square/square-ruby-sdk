
module Square
  module Bookings
    module TeamMemberProfiles
      module Types
        class ListTeamMemberProfilesRequest < Internal::Types::Model
          field :bookable_only, Internal::Types::Boolean, optional: true, nullable: false
          field :limit, Integer, optional: true, nullable: false
          field :cursor, String, optional: true, nullable: false
          field :location_id, String, optional: true, nullable: false

        end
      end
    end
  end
end
