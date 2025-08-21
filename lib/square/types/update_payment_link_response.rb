# frozen_string_literal: true

module Square
  module Types
    class UpdatePaymentLinkResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :payment_link, -> { Square::Types::PaymentLink }, optional: true, nullable: false
    end
  end
end
