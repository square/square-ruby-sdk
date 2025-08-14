# frozen_string_literal: true

module Square
  module Types
    class PayoutSentEventObject < Internal::Types::Model
      field :payout, Square::Payout, optional: true, nullable: false

    end
  end
end
