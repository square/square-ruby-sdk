# frozen_string_literal: true

module Square
  module TeamMembers
    module Types
      class UpdateTeamMembersRequest < Internal::Types::Model
        field :team_member_id, -> { String }, optional: false, nullable: false
        field :body, -> { Square::Types::UpdateTeamMemberRequest }, optional: false, nullable: false
      end
    end
  end
end
