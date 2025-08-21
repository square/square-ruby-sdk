# frozen_string_literal: true

module Square
  module Types
    # Describes an ad hoc item and price to generate a quick pay checkout link.
    # For more information,
    # see [Quick Pay Checkout](https://developer.squareup.com/docs/checkout-api/quick-pay-checkout).
    class QuickPay < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :price_money, -> { Square::Types::Money }, optional: false, nullable: false
      field :location_id, -> { String }, optional: false, nullable: false
    end
  end
end
