# frozen_string_literal: true

module Square
    module Types
        # Represents a response from a bulk create request containing the created `TeamMember` objects or error messages.
        class BatchCreateTeamMembersResponse < Square::Internal::Types::Model
            field :team_members, Square::Internal::Types::Hash[String, Square::CreateTeamMemberResponse], optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
