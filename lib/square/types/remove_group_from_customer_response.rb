# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of
        # a request to the [RemoveGroupFromCustomer](api-endpoint:Customers-RemoveGroupFromCustomer)
        # endpoint.
        class RemoveGroupFromCustomerResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
