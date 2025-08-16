# frozen_string_literal: true

module Square
  module Types
    # Represents a create request for a `TeamMember` object.
    class CreateTeamMemberRequest < Internal::Types::Model
      field :idempotency_key, String, optional: true, nullable: false
      field :team_member, Square::TeamMember, optional: true, nullable: false

    end
  end
end
