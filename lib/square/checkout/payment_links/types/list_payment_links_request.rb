
module Square
    module Checkout
        module PaymentLinks
            class ListPaymentLinksRequest
                field :cursor, String, optional: true, nullable: false
                field :limit, Integer, optional: true, nullable: false
            end
        end
    end
end
