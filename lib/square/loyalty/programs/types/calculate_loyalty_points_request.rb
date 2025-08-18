
module Square
  module Loyalty
    module Programs
      module Types
        class CalculateLoyaltyPointsRequest < Internal::Types::Model
          field :program_id, String, optional: false, nullable: false
          field :order_id, String, optional: true, nullable: false
          field :transaction_amount_money, Square::Types::Money, optional: true, nullable: false
          field :loyalty_account_id, String, optional: true, nullable: false

        end
      end
    end
  end
end
