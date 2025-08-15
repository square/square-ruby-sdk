# frozen_string_literal: true

module Square
  # Defines the fields that are included in the response body of
  # a request to the [CreateCustomer](api-endpoint:Customers-CreateCustomer) or
  # [BulkCreateCustomers](api-endpoint:Customers-BulkCreateCustomers) endpoint.
  # 
  # Either `errors` or `customer` is present in a given response (never both).
  class CreateCustomerResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :customer, Square::Customer, optional: true, nullable: false

  end
end
