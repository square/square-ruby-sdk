
module Square
    module Types
        module ActionCancelReason
            extends Square::Internal::Types::Enum
            BUYER_CANCELED = "BUYER_CANCELED"
            SELLER_CANCELED = "SELLER_CANCELED"
            TIMED_OUT = "TIMED_OUT"end
    end
end
