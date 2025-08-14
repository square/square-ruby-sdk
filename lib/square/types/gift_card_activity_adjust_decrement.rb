# frozen_string_literal: true

module Square
    module Types
        # Represents details about an `ADJUST_DECREMENT` [gift card activity type](entity:GiftCardActivityType).
        class GiftCardActivityAdjustDecrement < Square::Internal::Types::Model
            field :amount_money, Square::Money, optional: false, nullable: false
            field :reason, Square::GiftCardActivityAdjustDecrementReason, optional: false, nullable: false
        end
    end
end
