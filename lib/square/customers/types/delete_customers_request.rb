
module Square
  module Customers
    module Types
      class DeleteCustomersRequest < Internal::Types::Model
        field :customer_id, String, optional: false, nullable: false
        field :version, Integer, optional: true, nullable: false

      end
    end
  end
end
