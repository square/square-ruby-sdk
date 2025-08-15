# frozen_string_literal: true

module Square
  class PaymentUpdatedEventObject < Internal::Types::Model
    field :payment, Square::Payment, optional: true, nullable: false

  end
end
