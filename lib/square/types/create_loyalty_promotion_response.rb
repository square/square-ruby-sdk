# frozen_string_literal: true

module Square
  # Represents a [CreateLoyaltyPromotion](api-endpoint:Loyalty-CreateLoyaltyPromotion) response.
  # Either `loyalty_promotion` or `errors` is present in the response.
  class CreateLoyaltyPromotionResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :loyalty_promotion, Square::LoyaltyPromotion, optional: true, nullable: false

  end
end
