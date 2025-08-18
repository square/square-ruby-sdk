# frozen_string_literal: true

module Square
  module Types
    class ListPaymentLinksResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :payment_links, -> { Internal::Types::Array[Square::Types::PaymentLink] }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false

    end
  end
end
