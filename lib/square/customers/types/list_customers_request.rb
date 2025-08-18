
module Square
  module Customers
    module Types
      class ListCustomersRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :sort_field, -> { Square::Types::CustomerSortField }, optional: true, nullable: false
        field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: false
        field :count, -> { Internal::Types::Boolean }, optional: true, nullable: false

      end
    end
  end
end
