# frozen_string_literal: true

module Square
  # Defines the fields that are included in the response body of
  # a request to the [CreateCard](api-endpoint:Cards-CreateCard) endpoint.
  # 
  # Note: if there are errors processing the request, the card field will not be
  # present.
  class CreateCardResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :card, Square::Card, optional: true, nullable: false

  end
end
