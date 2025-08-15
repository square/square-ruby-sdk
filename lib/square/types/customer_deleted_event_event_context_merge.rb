# frozen_string_literal: true

module Square
  # Information about a merge operation, which creates a new customer using aggregated properties from two or more existing customers.
  class CustomerDeletedEventEventContextMerge < Internal::Types::Model
    field :from_customer_ids, Internal::Types::Array[String], optional: true, nullable: false
    field :to_customer_id, String, optional: true, nullable: false

  end
end
