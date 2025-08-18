# frozen_string_literal: true

module Square
  module Types
    # Represents details about an `ADJUST_INCREMENT` [gift card activity type](entity:GiftCardActivityType).
    class GiftCardActivityAdjustIncrement < Internal::Types::Model
      field :amount_money, -> { Square::Types::Money }, optional: false, nullable: false
      field :reason, -> { Square::Types::GiftCardActivityAdjustIncrementReason }, optional: false, nullable: false

    end
  end
end
