# frozen_string_literal: true

module Square
  module Types
    # The data associated with a `loyalty.promotion.created` event.
    class LoyaltyPromotionCreatedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: false
      field :id, -> { String }, optional: true, nullable: false
      field :object, -> { Square::Types::LoyaltyPromotionCreatedEventObject }, optional: true, nullable: false

    end
  end
end
