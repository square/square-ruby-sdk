# frozen_string_literal: true

module Square
  module Types
    # Represents a response from a create request containing the created `TeamMember` object or error messages.
    class CreateTeamMemberResponse < Internal::Types::Model
      field :team_member, -> { Square::Types::TeamMember }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
