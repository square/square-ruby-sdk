# frozen_string_literal: true

module Square
    module Types
        class TeamMemberUpdatedEventObject < Square::Internal::Types::Model
            field :team_member, Square::TeamMember, optional: true, nullable: false
        end
    end
end
