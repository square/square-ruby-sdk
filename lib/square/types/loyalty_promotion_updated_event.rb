# frozen_string_literal: true

module Square
  module Types
    # Published when a [loyalty promotion](entity:LoyaltyPromotion) is updated. This event is
    # invoked only when a loyalty promotion is canceled.
    class LoyaltyPromotionUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false
      field :type, -> { String }, optional: true, nullable: false
      field :event_id, -> { String }, optional: true, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :data, -> { Square::Types::LoyaltyPromotionUpdatedEventData }, optional: true, nullable: false

    end
  end
end
