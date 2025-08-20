# frozen_string_literal: true

module Square
  module Types
    # Filter based on [order fulfillment](entity:Fulfillment) information.
    class SearchOrdersFulfillmentFilter < Internal::Types::Model
      field :fulfillment_types, lambda {
        Internal::Types::Array[Square::Types::FulfillmentType]
      }, optional: true, nullable: false
      field :fulfillment_states, lambda {
        Internal::Types::Array[Square::Types::FulfillmentState]
      }, optional: true, nullable: false
    end
  end
end
