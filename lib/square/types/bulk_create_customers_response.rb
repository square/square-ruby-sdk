# frozen_string_literal: true

module Square
    module Types
        # Defines the fields included in the response body from the
        # [BulkCreateCustomers](api-endpoint:Customers-BulkCreateCustomers) endpoint.
        class BulkCreateCustomersResponse < Square::Internal::Types::Model
            field :responses, Square::Internal::Types::Hash[String, Square::CreateCustomerResponse], optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
