# frozen_string_literal: true

module Square
  module Types
    # Defines the response returned by [ListPaymentRefunds](api-endpoint:Refunds-ListPaymentRefunds).
    #
    # Either `errors` or `refunds` is present in a given response (never both).
    class ListPaymentRefundsResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :refunds, -> { Internal::Types::Array[Square::Types::PaymentRefund] }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
    end
  end
end
