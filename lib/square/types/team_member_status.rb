# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module TeamMemberStatus
      extend Square::Internal::Types::Enum

      ACTIVE = "ACTIVE"
      INACTIVE = "INACTIVE"
    end
  end
end
