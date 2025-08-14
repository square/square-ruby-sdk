
module Square
  module Customers
    module Cards
      class DeleteCardsRequest
        field :customer_id, String, optional: false, nullable: false
        field :card_id, String, optional: false, nullable: false

      end
    end
  end
end
