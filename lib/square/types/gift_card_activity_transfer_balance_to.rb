# frozen_string_literal: true

module Square
  # Represents details about a `TRANSFER_BALANCE_TO` [gift card activity type](entity:GiftCardActivityType).
  class GiftCardActivityTransferBalanceTo < Internal::Types::Model
    field :transfer_from_gift_card_id, String, optional: false, nullable: false
    field :amount_money, Square::Money, optional: false, nullable: false

  end
end
