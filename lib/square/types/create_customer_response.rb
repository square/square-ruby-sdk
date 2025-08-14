# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of
        # a request to the [CreateCustomer](api-endpoint:Customers-CreateCustomer) or
        # [BulkCreateCustomers](api-endpoint:Customers-BulkCreateCustomers) endpoint.
        # 
        # Either `errors` or `customer` is present in a given response (never both).
        class CreateCustomerResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :customer, Square::Customer, optional: true, nullable: false
        end
    end
end
