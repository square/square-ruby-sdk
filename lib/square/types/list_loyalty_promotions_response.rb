# frozen_string_literal: true

module Square
  # Represents a [ListLoyaltyPromotions](api-endpoint:Loyalty-ListLoyaltyPromotions) response.
  # One of `loyalty_promotions`, an empty object, or `errors` is present in the response.
  # If additional results are available, the `cursor` field is also present along with `loyalty_promotions`.
  class ListLoyaltyPromotionsResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :loyalty_promotions, Internal::Types::Array[Square::LoyaltyPromotion], optional: true, nullable: false
    field :cursor, String, optional: true, nullable: false

  end
end
