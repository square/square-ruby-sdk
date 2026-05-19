# frozen_string_literal: true

module Square
  module Types
    # Additional details about `WALLET` type payments with the `brand` of `LIGHTNING`.
    class LightningDetails < Internal::Types::Model
      field :payment_url, -> { String }, optional: true, nullable: false
    end
  end
end
