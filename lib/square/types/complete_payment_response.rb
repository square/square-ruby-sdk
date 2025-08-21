# frozen_string_literal: true

module Square
  module Types
    # Defines the response returned by[CompletePayment](api-endpoint:Payments-CompletePayment).
    class CompletePaymentResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :payment, -> { Square::Types::Payment }, optional: true, nullable: false
    end
  end
end
