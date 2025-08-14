# frozen_string_literal: true

module Square
    module Types
        # An object that contains the loyalty promotion associated with a `loyalty.promotion.updated` event.
        class LoyaltyPromotionUpdatedEventObject < Internal::Types::Model
            field :loyalty_promotion, Square::LoyaltyPromotion, optional: true, nullable: false
        end
    end
end
