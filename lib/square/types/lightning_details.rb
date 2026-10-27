# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Additional details about `WALLET` type payments with the `brand` of `LIGHTNING`.
    class LightningDetails < Internal::Types::Model
      field :payment_url, -> { String }, optional: true, nullable: true
    end
  end
end
