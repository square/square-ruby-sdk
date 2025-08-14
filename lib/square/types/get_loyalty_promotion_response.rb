# frozen_string_literal: true

module Square
    module Types
        # Represents a [RetrieveLoyaltyPromotionPromotions](api-endpoint:Loyalty-RetrieveLoyaltyPromotion) response.
        class GetLoyaltyPromotionResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :loyalty_promotion, Square::LoyaltyPromotion, optional: true, nullable: false
        end
    end
end
