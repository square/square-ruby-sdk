# frozen_string_literal: true

module Square
  module Labor
    module TeamMemberWages
      module Types
        class ListTeamMemberWagesRequest < Internal::Types::Model
          field :team_member_id, -> { String }, optional: true, nullable: true

          field :limit, -> { Integer }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
