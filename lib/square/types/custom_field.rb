# frozen_string_literal: true

module Square
  # Describes a custom form field to add to the checkout page to collect more information from buyers during checkout.
  # For more information,
  # see [Specify checkout options](https://developer.squareup.com/docs/checkout-api/optional-checkout-configurations#specify-checkout-options-1).
  class CustomField < Internal::Types::Model
    field :title, String, optional: false, nullable: false

  end
end
