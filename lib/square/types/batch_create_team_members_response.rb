# frozen_string_literal: true

module Square
  module Types
    # Represents a response from a bulk create request containing the created `TeamMember` objects or error messages.
    class BatchCreateTeamMembersResponse < Internal::Types::Model
      field :team_members, Internal::Types::Hash[String, Square::CreateTeamMemberResponse], optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

    end
  end
end
