# frozen_string_literal: true

module Square
  module Types
    class GetPayoutResponse < Internal::Types::Model
      field :payout, -> { Square::Types::Payout }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
