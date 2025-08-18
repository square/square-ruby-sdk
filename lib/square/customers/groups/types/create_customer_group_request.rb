
module Square
  module Customers
    module Groups
      module Types
        class CreateCustomerGroupRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: true, nullable: false
          field :group, -> { Square::Types::CustomerGroup }, optional: false, nullable: false

        end
      end
    end
  end
end
