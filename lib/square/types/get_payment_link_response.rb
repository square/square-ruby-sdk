# frozen_string_literal: true

module Square
  class GetPaymentLinkResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :payment_link, Square::PaymentLink, optional: true, nullable: false

  end
end
