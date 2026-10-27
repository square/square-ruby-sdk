# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when a [customer](entity:Customer) is updated. For more information, see [Use Customer
    # Webhooks](https://developer.squareup.com/docs/customers-api/use-the-api/customer-webhooks).
    #
    # Updates to the 'segment_ids' customer field does not invoke a `customer.updated` event. In addition, the
    # `customer` object in the event notification does not include this field.
    class CustomerUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::CustomerUpdatedEventData }, optional: true, nullable: false
    end
  end
end
