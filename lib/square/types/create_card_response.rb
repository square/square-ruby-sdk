# frozen_string_literal: true

module Square
    module Types
        # Defines the fields that are included in the response body of
        # a request to the [CreateCard](api-endpoint:Cards-CreateCard) endpoint.
        # 
        # Note: if there are errors processing the request, the card field will not be
        # present.
        class CreateCardResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :card, Square::Card, optional: true, nullable: false
        end
    end
end
