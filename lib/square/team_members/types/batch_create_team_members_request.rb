# frozen_string_literal: true

module Square
  module TeamMembers
    module Types
      class BatchCreateTeamMembersRequest < Internal::Types::Model
        field :team_members, lambda {
          Internal::Types::Hash[String, Square::Types::CreateTeamMemberRequest]
        }, optional: false, nullable: false
      end
    end
  end
end
