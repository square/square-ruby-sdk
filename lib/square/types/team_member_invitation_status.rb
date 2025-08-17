# frozen_string_literal: true

module Square
  module Types
    module TeamMemberInvitationStatus
      extends Square::Internal::Types::Enum
      UNINVITED = "UNINVITED"
      PENDING = "PENDING"
      ACCEPTED = "ACCEPTED"end
  end
end
