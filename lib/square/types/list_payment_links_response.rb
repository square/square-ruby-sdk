# frozen_string_literal: true

module Square
  module Types
    class ListPaymentLinksResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :payment_links, Internal::Types::Array[Square::PaymentLink], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false

    end
  end
end
