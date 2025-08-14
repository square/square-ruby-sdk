
module Square
  class TeamMemberInvitationStatus
    includes Square::Internal::Types::Enum
    UNINVITED = "UNINVITED"
    PENDING = "PENDING"
    ACCEPTED = "ACCEPTED"
  end
end
