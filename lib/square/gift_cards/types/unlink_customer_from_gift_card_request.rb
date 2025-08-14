
module Square
    module GiftCards
        class UnlinkCustomerFromGiftCardRequest < Square::Internal::Types::Model
            field :gift_card_id, String, optional: false, nullable: false
        end
    end
end
