
module Square
  module Labor
    module TeamMemberWages
      module Types
        class ListTeamMemberWagesRequest < Internal::Types::Model
          field :team_member_id, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :cursor, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
