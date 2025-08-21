# frozen_string_literal: true

module Square
  module Types
    # Represents details about a `TRANSFER_BALANCE_FROM` [gift card activity type](entity:GiftCardActivityType).
    class GiftCardActivityTransferBalanceFrom < Internal::Types::Model
      field :transfer_to_gift_card_id, -> { String }, optional: false, nullable: false
      field :amount_money, -> { Square::Types::Money }, optional: false, nullable: false
    end
  end
end
