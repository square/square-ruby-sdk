# frozen_string_literal: true

module Square
  module Types
    # Defines the fields included in the response body from the
    # [BulkUpdateCustomers](api-endpoint:Customers-BulkUpdateCustomers) endpoint.
    class BulkUpdateCustomersResponse < Internal::Types::Model
      field :responses, Internal::Types::Hash[String, Square::Types::UpdateCustomerResponse], optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
