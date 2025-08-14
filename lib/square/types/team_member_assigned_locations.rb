# frozen_string_literal: true

module Square
    module Types
        # An object that represents a team member's assignment to locations.
        class TeamMemberAssignedLocations < Square::Internal::Types::Model
            field :assignment_type, Square::TeamMemberAssignedLocationsAssignmentType, optional: true, nullable: false
            field :location_ids, Square::Internal::Types::Array[String], optional: true, nullable: false
        end
    end
end
