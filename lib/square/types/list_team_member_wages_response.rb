# frozen_string_literal: true

module Square
  module Types
    # The response to a request for a set of `TeamMemberWage` objects. The response contains
    # a set of `TeamMemberWage` objects.
    class ListTeamMemberWagesResponse < Internal::Types::Model
      field :team_member_wages, lambda {
        Internal::Types::Array[Square::Types::TeamMemberWage]
      }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
