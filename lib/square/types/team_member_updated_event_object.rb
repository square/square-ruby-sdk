# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class TeamMemberUpdatedEventObject < Internal::Types::Model
      field :team_member, -> { Square::Types::TeamMember }, optional: true, nullable: false
    end
  end
end
