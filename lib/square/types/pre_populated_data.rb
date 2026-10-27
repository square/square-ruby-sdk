# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Describes buyer data to prepopulate in the payment form.
    # For more information,
    # see [Optional Checkout
    # Configurations](https://developer.squareup.com/docs/checkout-api/optional-checkout-configurations).
    class PrePopulatedData < Internal::Types::Model
      field :buyer_email, -> { String }, optional: true, nullable: true

      field :buyer_phone_number, -> { String }, optional: true, nullable: true

      field :buyer_address, -> { Square::Types::Address }, optional: true, nullable: false
    end
  end
end
