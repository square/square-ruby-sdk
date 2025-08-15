# frozen_string_literal: true

module Square
  # The data associated with a `loyalty.promotion.updated` event.
  class LoyaltyPromotionUpdatedEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::LoyaltyPromotionUpdatedEventObject, optional: true, nullable: false

  end
end
