# frozen_string_literal: true

module Square
  # The payment the cardholder disputed.
  class DisputedPayment < Internal::Types::Model
    field :payment_id, String, optional: true, nullable: false

  end
end
