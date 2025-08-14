
module Square
    module Types
        class V1OrderHistoryEntryAction < Square::Internal::Types::Enum
            ORDER_PLACED = "ORDER_PLACED"
            DECLINED = "DECLINED"
            PAYMENT_RECEIVED = "PAYMENT_RECEIVED"
            CANCELED = "CANCELED"
            COMPLETED = "COMPLETED"
            REFUNDED = "REFUNDED"
            EXPIRED = "EXPIRED"
        end
    end
end
