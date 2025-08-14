# frozen_string_literal: true

module Square
    module Types
        # Represents a [ListLoyaltyPromotions](api-endpoint:Loyalty-ListLoyaltyPromotions) response.
        # One of `loyalty_promotions`, an empty object, or `errors` is present in the response.
        # If additional results are available, the `cursor` field is also present along with `loyalty_promotions`.
        class ListLoyaltyPromotionsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :loyalty_promotions, Square::Internal::Types::Array[Square::LoyaltyPromotion], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
