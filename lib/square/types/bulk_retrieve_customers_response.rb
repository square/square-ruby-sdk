# frozen_string_literal: true

module Square
  module Types
    # Defines the fields included in the response body from the
    # [BulkRetrieveCustomers](api-endpoint:Customers-BulkRetrieveCustomers) endpoint.
    class BulkRetrieveCustomersResponse < Internal::Types::Model
      field :responses, -> { Internal::Types::Hash[String, Square::Types::GetCustomerResponse] }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
