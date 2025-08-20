# frozen_string_literal: true

module Square
  module Types
    # Represents the number of times a buyer can earn points during a [loyalty promotion](entity:LoyaltyPromotion).
    # If this field is not set, buyers can trigger the promotion an unlimited number of times to earn points during
    # the time that the promotion is available.
    #
    # A purchase that is disqualified from earning points because of this limit might qualify for another active promotion.
    class LoyaltyPromotionTriggerLimit < Internal::Types::Model
      field :times, -> { Integer }, optional: false, nullable: false
      field :interval, -> { Square::Types::LoyaltyPromotionTriggerLimitInterval }, optional: true, nullable: false
    end
  end
end
