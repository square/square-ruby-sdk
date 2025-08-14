# frozen_string_literal: true

module Square
    module Types
        # A response to a request to get a `TeamMemberWage`. The response contains
        # the requested `TeamMemberWage` objects and might contain a set of `Error` objects if
        # the request resulted in errors.
        class GetTeamMemberWageResponse < Square::Internal::Types::Model
            field :team_member_wage, Square::TeamMemberWage, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
