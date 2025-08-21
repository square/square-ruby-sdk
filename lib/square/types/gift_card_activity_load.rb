# frozen_string_literal: true

module Square
  module Types
    # Represents details about a `LOAD` [gift card activity type](entity:GiftCardActivityType).
    class GiftCardActivityLoad < Internal::Types::Model
      field :amount_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :order_id, -> { String }, optional: true, nullable: false
      field :line_item_uid, -> { String }, optional: true, nullable: false
      field :reference_id, -> { String }, optional: true, nullable: false
      field :buyer_payment_instrument_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
