# frozen_string_literal: true

module Square
  module Types
    # Filtering criteria to use for a `SearchOrders` request. Multiple filters
    # are ANDed together.
    class SearchOrdersFilter < Internal::Types::Model
      field :state_filter, -> { Square::Types::SearchOrdersStateFilter }, optional: true, nullable: false
      field :date_time_filter, -> { Square::Types::SearchOrdersDateTimeFilter }, optional: true, nullable: false
      field :fulfillment_filter, -> { Square::Types::SearchOrdersFulfillmentFilter }, optional: true, nullable: false
      field :source_filter, -> { Square::Types::SearchOrdersSourceFilter }, optional: true, nullable: false
      field :customer_filter, -> { Square::Types::SearchOrdersCustomerFilter }, optional: true, nullable: false
    end
  end
end
