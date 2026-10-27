# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class PayoutPaidEventObject < Internal::Types::Model
      field :payout, -> { Square::Types::Payout }, optional: true, nullable: false
    end
  end
end
