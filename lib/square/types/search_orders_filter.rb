# frozen_string_literal: true

module Square
    module Types
        # Filtering criteria to use for a `SearchOrders` request. Multiple filters
        # are ANDed together.
        class SearchOrdersFilter < Internal::Types::Model
            field :state_filter, Square::SearchOrdersStateFilter, optional: true, nullable: false
            field :date_time_filter, Square::SearchOrdersDateTimeFilter, optional: true, nullable: false
            field :fulfillment_filter, Square::SearchOrdersFulfillmentFilter, optional: true, nullable: false
            field :source_filter, Square::SearchOrdersSourceFilter, optional: true, nullable: false
            field :customer_filter, Square::SearchOrdersCustomerFilter, optional: true, nullable: false
        end
    end
end
