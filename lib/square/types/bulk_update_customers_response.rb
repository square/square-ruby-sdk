# frozen_string_literal: true

module Square
    module Types
        # Defines the fields included in the response body from the
        # [BulkUpdateCustomers](api-endpoint:Customers-BulkUpdateCustomers) endpoint.
        class BulkUpdateCustomersResponse < Square::Internal::Types::Model
            field :responses, Square::Internal::Types::Hash[String, Square::UpdateCustomerResponse], optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
