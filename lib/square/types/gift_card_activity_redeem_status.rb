
module Square
    module Types
        class GiftCardActivityRedeemStatus
            extends Square::Internal::Types::Enum
            PENDING = "PENDING"
            COMPLETED = "COMPLETED"
            CANCELED = "CANCELED"
        end
    end
end
