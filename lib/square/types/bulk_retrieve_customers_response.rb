# frozen_string_literal: true

module Square
    module Types
        # Defines the fields included in the response body from the
        # [BulkRetrieveCustomers](api-endpoint:Customers-BulkRetrieveCustomers) endpoint.
        class BulkRetrieveCustomersResponse < Square::Internal::Types::Model
            field :responses, Square::Internal::Types::Hash[String, Square::GetCustomerResponse], optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
