# frozen_string_literal: true

module Square
  module Types
    # Defines the response returned by [ListPayments](api-endpoint:Payments-ListPayments).
    class ListPaymentsResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :payments, -> { Internal::Types::Array[Square::Types::Payment] }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
    end
  end
end
