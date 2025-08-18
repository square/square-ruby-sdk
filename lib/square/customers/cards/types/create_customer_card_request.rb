
module Square
  module Customers
    module Cards
      module Types
        class CreateCustomerCardRequest < Internal::Types::Model
          field :customer_id, String, optional: false, nullable: false
          field :card_nonce, String, optional: false, nullable: false
          field :billing_address, Square::Types::Address, optional: true, nullable: false
          field :cardholder_name, String, optional: true, nullable: false
          field :verification_token, String, optional: true, nullable: false

        end
      end
    end
  end
end
