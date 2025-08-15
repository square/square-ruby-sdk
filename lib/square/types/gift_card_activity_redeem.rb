# frozen_string_literal: true

module Square
  # Represents details about a `REDEEM` [gift card activity type](entity:GiftCardActivityType).
  class GiftCardActivityRedeem < Internal::Types::Model
    field :amount_money, Square::Money, optional: false, nullable: false
    field :payment_id, String, optional: true, nullable: false
    field :reference_id, String, optional: true, nullable: false
    field :status, Square::GiftCardActivityRedeemStatus, optional: true, nullable: false

  end
end
