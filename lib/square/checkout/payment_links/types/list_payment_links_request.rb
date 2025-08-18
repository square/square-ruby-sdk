
module Square
  module Checkout
    module PaymentLinks
      module Types
        class ListPaymentLinksRequest < Internal::Types::Model
          field :cursor, String, optional: true, nullable: false
          field :limit, Integer, optional: true, nullable: false

        end
      end
    end
  end
end
