# frozen_string_literal: true

module Square
  module Customers
    module Types
      class GetCustomersRequest < Internal::Types::Model
        field :customer_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
