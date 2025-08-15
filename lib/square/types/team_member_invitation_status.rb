
module Square
  class TeamMemberInvitationStatus
    include Square::Internal::Types::Enum
    UNINVITED = "UNINVITED"
    PENDING = "PENDING"
    ACCEPTED = "ACCEPTED"
  end
end
