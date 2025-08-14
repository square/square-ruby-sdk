
module Square
    module Types
        class BankAccountStatus
            extends Square::Internal::Types::Enum
            VERIFICATION_IN_PROGRESS = "VERIFICATION_IN_PROGRESS"
            VERIFIED = "VERIFIED"
            DISABLED = "DISABLED"
        end
    end
end
