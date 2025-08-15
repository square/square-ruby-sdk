# frozen_string_literal: true

module Square
  # Represents a response from an update request containing the updated `TeamMember` object or error messages.
  class UpdateTeamMemberResponse < Internal::Types::Model
    field :team_member, Square::TeamMember, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
