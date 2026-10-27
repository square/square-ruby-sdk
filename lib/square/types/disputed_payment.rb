# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The payment the cardholder disputed.
    class DisputedPayment < Internal::Types::Model
      field :payment_id, -> { String }, optional: true, nullable: true
    end
  end
end
