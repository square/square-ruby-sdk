# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Information about a merge operation, which creates a new customer using aggregated properties from two or more
    # existing customers.
    class CustomerCreatedEventEventContextMerge < Internal::Types::Model
      field :from_customer_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :to_customer_id, -> { String }, optional: true, nullable: true
    end
  end
end
