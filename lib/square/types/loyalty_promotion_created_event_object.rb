# frozen_string_literal: true

module Square
  # An object that contains the loyalty promotion associated with a `loyalty.promotion.created` event.
  class LoyaltyPromotionCreatedEventObject < Internal::Types::Model
    field :loyalty_promotion, Square::LoyaltyPromotion, optional: true, nullable: false

  end
end
