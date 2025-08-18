
module Square
  module Checkout
    module PaymentLinks
      module Types
        class UpdatePaymentLinkRequest < Internal::Types::Model
          field :id, String, optional: false, nullable: false
          field :payment_link, Square::Types::PaymentLink, optional: false, nullable: false

        end
      end
    end
  end
end
