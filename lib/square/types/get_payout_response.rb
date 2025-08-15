# frozen_string_literal: true

module Square
  class GetPayoutResponse < Internal::Types::Model
    field :payout, Square::Payout, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
