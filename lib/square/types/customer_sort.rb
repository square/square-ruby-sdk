# frozen_string_literal: true

module Square
  module Types
    # Represents the sorting criteria in a [search query](entity:CustomerQuery) that defines how to sort
    # customer profiles returned in [SearchCustomers](api-endpoint:Customers-SearchCustomers) results.
    class CustomerSort < Internal::Types::Model
      field :field, -> { Square::Types::CustomerSortField }, optional: true, nullable: false
      field :order, -> { Square::Types::SortOrder }, optional: true, nullable: false

    end
  end
end
