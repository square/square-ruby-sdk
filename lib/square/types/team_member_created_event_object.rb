# frozen_string_literal: true

module Square
  module Types
    class TeamMemberCreatedEventObject < Internal::Types::Model
      field :team_member, -> { Square::Types::TeamMember }, optional: true, nullable: false

    end
  end
end
