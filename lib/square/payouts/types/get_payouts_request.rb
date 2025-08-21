# frozen_string_literal: true

module Square
  module Payouts
    module Types
      class GetPayoutsRequest < Internal::Types::Model
        field :payout_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
