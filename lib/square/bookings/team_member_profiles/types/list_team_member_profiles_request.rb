# frozen_string_literal: true

module Square
  module Bookings
    module TeamMemberProfiles
      module Types
        class ListTeamMemberProfilesRequest < Internal::Types::Model
          field :bookable_only, -> { Internal::Types::Boolean }, optional: true, nullable: true

          field :limit, -> { Integer }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true

          field :location_id, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
