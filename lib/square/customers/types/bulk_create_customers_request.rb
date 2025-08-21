# frozen_string_literal: true

module Square
  module Customers
    module Types
      class BulkCreateCustomersRequest < Internal::Types::Model
        field :customers, lambda {
          Internal::Types::Hash[String, Square::Types::BulkCreateCustomerData]
        }, optional: false, nullable: false
      end
    end
  end
end
