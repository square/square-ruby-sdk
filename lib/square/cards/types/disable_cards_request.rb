
module Square
    module Cards
        class DisableCardsRequest < Square::Internal::Types::Model
            field :card_id, String, optional: false, nullable: false
        end
    end
end
