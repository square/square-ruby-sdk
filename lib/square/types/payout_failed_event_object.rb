# frozen_string_literal: true

module Square
  class PayoutFailedEventObject < Internal::Types::Model
    field :payout, Square::Payout, optional: true, nullable: false

  end
end
