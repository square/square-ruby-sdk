# frozen_string_literal: true

module Square
  module Types
    # Represents a [CancelLoyaltyPromotion](api-endpoint:Loyalty-CancelLoyaltyPromotion) response.
    # Either `loyalty_promotion` or `errors` is present in the response.
    class CancelLoyaltyPromotionResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :loyalty_promotion, Square::Types::LoyaltyPromotion, optional: true, nullable: false

    end
  end
end
