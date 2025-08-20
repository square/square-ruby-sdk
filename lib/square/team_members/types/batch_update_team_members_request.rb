# frozen_string_literal: true

module Square
  module TeamMembers
    module Types
      class BatchUpdateTeamMembersRequest < Internal::Types::Model
        field :team_members, lambda {
          Internal::Types::Hash[String, Square::Types::UpdateTeamMemberRequest]
        }, optional: false, nullable: false
      end
    end
  end
end
