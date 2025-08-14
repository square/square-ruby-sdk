# frozen_string_literal: true

module Square
    module Types
        # Represents an update request for a `TeamMember` object.
        class UpdateTeamMemberRequest < Square::Internal::Types::Model
            field :team_member, Square::TeamMember, optional: true, nullable: false
        end
    end
end
