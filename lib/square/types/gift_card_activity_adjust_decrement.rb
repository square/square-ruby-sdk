# frozen_string_literal: true

module Square
  module Types
    # Represents details about an `ADJUST_DECREMENT` [gift card activity type](entity:GiftCardActivityType).
    class GiftCardActivityAdjustDecrement < Internal::Types::Model
      field :amount_money, Square::Types::Money, optional: false, nullable: false
      field :reason, Square::Types::GiftCardActivityAdjustDecrementReason, optional: false, nullable: false

    end
  end
end
