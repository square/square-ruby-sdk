# frozen_string_literal: true

module Square
  class RefundUpdatedEventObject < Internal::Types::Model
    field :refund, Square::PaymentRefund, optional: true, nullable: false

  end
end
