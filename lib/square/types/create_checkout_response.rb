# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of
        # a request to the `CreateCheckout` endpoint.
        class CreateCheckoutResponse < Square::Internal::Types::Model
            field :checkout, Square::Checkout, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
