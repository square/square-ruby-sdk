# frozen_string_literal: true

module Square
  module Types
    class PaymentBalanceActivityReleaseAdjustmentDetail < Internal::Types::Model
      field :payment_id, -> { String }, optional: true, nullable: false
    end
  end
end
