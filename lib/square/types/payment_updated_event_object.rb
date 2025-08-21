# frozen_string_literal: true

module Square
  module Types
    class PaymentUpdatedEventObject < Internal::Types::Model
      field :payment, -> { Square::Types::Payment }, optional: true, nullable: false
    end
  end
end
