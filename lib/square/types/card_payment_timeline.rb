# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The timeline for card payments.
    class CardPaymentTimeline < Internal::Types::Model
      field :authorized_at, -> { String }, optional: true, nullable: true

      field :captured_at, -> { String }, optional: true, nullable: true

      field :voided_at, -> { String }, optional: true, nullable: true
    end
  end
end
