# frozen_string_literal: true

module Square
  module Types
    # The custom attribute filter. Use this filter in a set of [custom attribute filters](entity:CustomerCustomAttributeFilters) to search
    # based on the value or last updated date of a customer-related [custom attribute](entity:CustomAttribute).
    class CustomerCustomAttributeFilter < Internal::Types::Model
      field :key, String, optional: false, nullable: false
      field :filter, Square::Types::CustomerCustomAttributeFilterValue, optional: true, nullable: false
      field :updated_at, Square::Types::TimeRange, optional: true, nullable: false

    end
  end
end
