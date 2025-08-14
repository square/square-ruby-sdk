# frozen_string_literal: true

module Square
    module Types
        # Published when a [customer](entity:Customer) is updated. For more information, see [Use Customer Webhooks](https://developer.squareup.com/docs/customers-api/use-the-api/customer-webhooks).
        # 
        # Updates to the 'segment_ids' customer field does not invoke a `customer.updated` event. In addition, the `customer` object in the event notification does not include this field.
        class CustomerUpdatedEvent < Square::Internal::Types::Model
            field :merchant_id, String, optional: true, nullable: false
            field :type, String, optional: true, nullable: false
            field :event_id, String, optional: true, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :data, Square::CustomerUpdatedEventData, optional: true, nullable: false
        end
    end
end
