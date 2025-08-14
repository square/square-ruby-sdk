
module Square
    module Types
        module V1OrderHistoryEntryAction
            extends Square::Internal::Types::Enum
            ORDER_PLACED = "ORDER_PLACED"
            DECLINED = "DECLINED"
            PAYMENT_RECEIVED = "PAYMENT_RECEIVED"
            CANCELED = "CANCELED"
            COMPLETED = "COMPLETED"
            REFUNDED = "REFUNDED"
            EXPIRED = "EXPIRED"end
    end
end
