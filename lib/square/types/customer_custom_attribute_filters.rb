# frozen_string_literal: true

module Square
    module Types
        # The custom attribute filters in a set of [customer filters](entity:CustomerFilter) used in a search query. Use this filter
        # to search based on [custom attributes](entity:CustomAttribute) that are assigned to customer profiles. For more information, see
        # [Search by custom attribute](https://developer.squareup.com/docs/customers-api/use-the-api/search-customers#search-by-custom-attribute).
        class CustomerCustomAttributeFilters < Square::Internal::Types::Model
            field :filters, Square::Internal::Types::Array[Square::CustomerCustomAttributeFilter], optional: true, nullable: false
        end
    end
end
