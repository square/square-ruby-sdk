
module Square
  module Customers
    module Types
      class SearchCustomersRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :query, -> { Square::Types::CustomerQuery }, optional: true, nullable: false
        field :count, -> { Internal::Types::Boolean }, optional: true, nullable: false

      end
    end
  end
end
