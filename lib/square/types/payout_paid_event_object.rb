# frozen_string_literal: true

module Square
  class PayoutPaidEventObject < Internal::Types::Model
    field :payout, Square::Payout, optional: true, nullable: false

  end
end
