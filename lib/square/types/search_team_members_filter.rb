# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a filter used in a search for `TeamMember` objects. `AND` logic is applied
    # between the individual fields, and `OR` logic is applied within list-based fields.
    # For example, setting this filter value:
    # ```
    # filter = (locations_ids = ["A", "B"], status = ACTIVE)
    # ```
    # returns only active team members assigned to either location "A" or "B".
    class SearchTeamMembersFilter < Internal::Types::Model
      field :location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :status, -> { Square::Types::TeamMemberStatus }, optional: true, nullable: false

      field :is_owner, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
