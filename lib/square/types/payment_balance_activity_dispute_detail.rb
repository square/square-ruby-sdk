# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class PaymentBalanceActivityDisputeDetail < Internal::Types::Model
      field :payment_id, -> { String }, optional: true, nullable: true

      field :dispute_id, -> { String }, optional: true, nullable: true
    end
  end
end
