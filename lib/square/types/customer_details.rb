# frozen_string_literal: true

module Square
  module Types
    # Details about the customer making the payment.
    class CustomerDetails < Internal::Types::Model
      field :customer_initiated, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :seller_keyed_in, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
