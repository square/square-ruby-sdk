
module Square
  module Customers
    module Types
      class BulkRetrieveCustomersRequest < Internal::Types::Model
        field :customer_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      end
    end
  end
end
