# frozen_string_literal: true

module Square
  module Customers
    module Types
      class ListCustomersRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: true

        field :limit, -> { Integer }, optional: true, nullable: true

        field :sort_field, -> { Square::Types::CustomerSortField }, optional: true, nullable: true

        field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: true

        field :count, -> { Internal::Types::Boolean }, optional: true, nullable: true
      end
    end
  end
end
