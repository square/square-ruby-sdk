# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Filter based on [order fulfillment](entity:Fulfillment) information.
    class SearchOrdersFulfillmentFilter < Internal::Types::Model
      field :fulfillment_types, -> { Internal::Types::Array[Square::Types::FulfillmentType] }, optional: true, nullable: true

      field :fulfillment_states, -> { Internal::Types::Array[Square::Types::FulfillmentState] }, optional: true, nullable: true
    end
  end
end
