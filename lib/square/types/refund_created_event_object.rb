# frozen_string_literal: true

module Square
  module Types
    class RefundCreatedEventObject < Internal::Types::Model
      field :refund, -> { Square::Types::PaymentRefund }, optional: true, nullable: false
    end
  end
end
