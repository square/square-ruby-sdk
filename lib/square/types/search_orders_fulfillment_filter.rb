# frozen_string_literal: true

module Square
    module Types
        # Filter based on [order fulfillment](entity:Fulfillment) information.
        class SearchOrdersFulfillmentFilter < Square::Internal::Types::Model
            field :fulfillment_types, Square::Internal::Types::Array[Square::FulfillmentType], optional: true, nullable: false
            field :fulfillment_states, Square::Internal::Types::Array[Square::FulfillmentState], optional: true, nullable: false
        end
    end
end
