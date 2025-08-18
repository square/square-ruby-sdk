# frozen_string_literal: true

module Square
  module Types
    # Represents a payout fee that can incur as part of a payout.
    class PayoutFee < Internal::Types::Model
      field :amount_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :effective_at, -> { String }, optional: true, nullable: false
      field :type, -> { Square::Types::PayoutFeeType }, optional: true, nullable: false

    end
  end
end
