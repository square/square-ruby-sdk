# frozen_string_literal: true

module Square
  module Types
    # Represents a response from a bulk update request containing the updated `TeamMember` objects or error messages.
    class BatchUpdateTeamMembersResponse < Internal::Types::Model
      field :team_members, Internal::Types::Hash[String, Square::Types::UpdateTeamMemberResponse], optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
