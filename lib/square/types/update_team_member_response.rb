# frozen_string_literal: true

module Square
  module Types
    # Represents a response from an update request containing the updated `TeamMember` object or error messages.
    class UpdateTeamMemberResponse < Internal::Types::Model
      field :team_member, Square::Types::TeamMember, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
