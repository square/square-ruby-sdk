# frozen_string_literal: true

module Square
  module Types
    # Represents details about a `REFUND` [gift card activity type](entity:GiftCardActivityType).
    class GiftCardActivityRefund < Internal::Types::Model
      field :redeem_activity_id, -> { String }, optional: true, nullable: false
      field :amount_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :reference_id, -> { String }, optional: true, nullable: false
      field :payment_id, -> { String }, optional: true, nullable: false
    end
  end
end
