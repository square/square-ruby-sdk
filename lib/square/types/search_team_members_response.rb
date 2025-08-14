# frozen_string_literal: true

module Square
    module Types
        # Represents a response from a search request containing a filtered list of `TeamMember` objects.
        class SearchTeamMembersResponse < Square::Internal::Types::Model
            field :team_members, Square::Internal::Types::Array[Square::TeamMember], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
