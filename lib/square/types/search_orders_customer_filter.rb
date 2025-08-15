# frozen_string_literal: true

module Square
  # A filter based on the order `customer_id` and any tender `customer_id`
  # associated with the order. It does not filter based on the
  # [FulfillmentRecipient](entity:FulfillmentRecipient) `customer_id`.
  class SearchOrdersCustomerFilter < Internal::Types::Model
    field :customer_ids, Internal::Types::Array[String], optional: true, nullable: false

  end
end
