# frozen_string_literal: true

module Square
  module Types
    # Filter based on [order fulfillment](entity:Fulfillment) information.
    class SearchOrdersFulfillmentFilter < Internal::Types::Model
      field :fulfillment_types, Internal::Types::Array[Square::FulfillmentType], optional: true, nullable: false
      field :fulfillment_states, Internal::Types::Array[Square::FulfillmentState], optional: true, nullable: false

    end
  end
end
