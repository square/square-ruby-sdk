# frozen_string_literal: true

module Square
    module Types
        # Represents a response from a retrieve request containing a `TeamMember` object or error messages.
        class GetTeamMemberResponse < Square::Internal::Types::Model
            field :team_member, Square::TeamMember, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
