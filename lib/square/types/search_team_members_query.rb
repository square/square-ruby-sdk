# frozen_string_literal: true

module Square
    module Types
        # Represents the parameters in a search for `TeamMember` objects.
        class SearchTeamMembersQuery < Internal::Types::Model
            field :filter, Square::SearchTeamMembersFilter, optional: true, nullable: false
        end
    end
end
