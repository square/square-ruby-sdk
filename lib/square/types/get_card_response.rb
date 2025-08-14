# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the [RetrieveCard](api-endpoint:Cards-RetrieveCard) endpoint.
    # 
    # Note: if there are errors processing the request, the card field will not be
    # present.
    class GetCardResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :card, Square::Card, optional: true, nullable: false

    end
  end
end
