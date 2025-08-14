# frozen_string_literal: true

module Square
    module Types
        # Defines the fields included in the response body from the
        # [BulkDeleteCustomers](api-endpoint:Customers-BulkDeleteCustomers) endpoint.
        class BulkDeleteCustomersResponse < Internal::Types::Model
            field :responses, Internal::Types::Hash[String, Square::DeleteCustomerResponse], optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
