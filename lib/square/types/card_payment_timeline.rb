# frozen_string_literal: true

module Square
  # The timeline for card payments.
  class CardPaymentTimeline < Internal::Types::Model
    field :authorized_at, String, optional: true, nullable: false
    field :captured_at, String, optional: true, nullable: false
    field :voided_at, String, optional: true, nullable: false

  end
end
