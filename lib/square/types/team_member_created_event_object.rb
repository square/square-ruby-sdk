# frozen_string_literal: true

module Square
  class TeamMemberCreatedEventObject < Internal::Types::Model
    field :team_member, Square::TeamMember, optional: true, nullable: false

  end
end
