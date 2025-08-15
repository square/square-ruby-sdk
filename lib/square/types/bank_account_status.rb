
module Square
  class BankAccountStatus
    include Square::Internal::Types::Enum
    VERIFICATION_IN_PROGRESS = "VERIFICATION_IN_PROGRESS"
    VERIFIED = "VERIFIED"
    DISABLED = "DISABLED"
  end
end
