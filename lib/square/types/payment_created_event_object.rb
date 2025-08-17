# frozen_string_literal: true

module Square
  module Types
    class PaymentCreatedEventObject < Internal::Types::Model
      field :payment, Square::Types::Payment, optional: true, nullable: false

    end
  end
end
