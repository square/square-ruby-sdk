# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # An object that represents a team member's assignment to locations.
    class TeamMemberAssignedLocations < Internal::Types::Model
      field :assignment_type, -> { Square::Types::TeamMemberAssignedLocationsAssignmentType }, optional: true, nullable: false

      field :location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true
    end
  end
end
