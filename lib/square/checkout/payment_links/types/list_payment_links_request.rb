# frozen_string_literal: true

module Square
  module Checkout
    module PaymentLinks
      module Types
        class ListPaymentLinksRequest < Internal::Types::Model
          field :cursor, -> { String }, optional: true, nullable: true

          field :limit, -> { Integer }, optional: true, nullable: true
        end
      end
    end
  end
end
