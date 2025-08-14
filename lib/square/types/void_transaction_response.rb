# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of
        # a request to the [VoidTransaction](api-endpoint:Transactions-VoidTransaction) endpoint.
        class VoidTransactionResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
