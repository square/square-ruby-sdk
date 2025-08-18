# frozen_string_literal: true

module Square
  module Types
    class PayoutPaidEventObject < Internal::Types::Model
      field :payout, Square::Types::Payout, optional: true, nullable: false

    end
  end
end
