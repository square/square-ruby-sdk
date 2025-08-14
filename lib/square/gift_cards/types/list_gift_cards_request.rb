
module Square
    module GiftCards
        class ListGiftCardsRequest < Square::Internal::Types::Model
            field :type, String, optional: true, nullable: false
            field :state, String, optional: true, nullable: false
            field :limit, Integer, optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :customer_id, String, optional: true, nullable: false
        end
    end
end
