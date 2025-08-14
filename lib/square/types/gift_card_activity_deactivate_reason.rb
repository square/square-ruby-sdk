
module Square
    module Types
        class GiftCardActivityDeactivateReason < Square::Internal::Types::Enum
            SUSPICIOUS_ACTIVITY = "SUSPICIOUS_ACTIVITY"
            UNKNOWN_REASON = "UNKNOWN_REASON"
            CHARGEBACK_DEACTIVATE = "CHARGEBACK_DEACTIVATE"
        end
    end
end
