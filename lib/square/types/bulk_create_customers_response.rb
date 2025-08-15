# frozen_string_literal: true

module Square
  # Defines the fields included in the response body from the
  # [BulkCreateCustomers](api-endpoint:Customers-BulkCreateCustomers) endpoint.
  class BulkCreateCustomersResponse < Internal::Types::Model
    field :responses, Internal::Types::Hash[String, Square::CreateCustomerResponse], optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
