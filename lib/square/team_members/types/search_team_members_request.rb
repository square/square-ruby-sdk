# frozen_string_literal: true

module Square
  module TeamMembers
    module Types
      class SearchTeamMembersRequest < Internal::Types::Model
        field :query, -> { Square::Types::SearchTeamMembersQuery }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end
