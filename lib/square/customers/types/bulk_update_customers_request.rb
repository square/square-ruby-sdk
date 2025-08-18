
module Square
  module Customers
    module Types
      class BulkUpdateCustomersRequest < Internal::Types::Model
        field :customers, -> { Internal::Types::Hash[String, Square::Types::BulkUpdateCustomerData] }, optional: false, nullable: false

      end
    end
  end
end
