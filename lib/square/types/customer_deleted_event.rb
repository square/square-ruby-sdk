# frozen_string_literal: true

module Square
  # Published when a [customer](entity:Customer) is deleted.  For more information, see [Use Customer Webhooks](https://developer.squareup.com/docs/customers-api/use-the-api/customer-webhooks).
  # 
  # The `customer` object in the event notification does not include the following fields: `group_ids` and `segment_ids`.
  class CustomerDeletedEvent < Internal::Types::Model
    field :merchant_id, String, optional: true, nullable: false
    field :type, String, optional: true, nullable: false
    field :event_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :data, Square::CustomerDeletedEventData, optional: true, nullable: false

  end
end
