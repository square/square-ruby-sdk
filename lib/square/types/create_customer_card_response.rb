# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the `CreateCustomerCard` endpoint.
    # 
    # Either `errors` or `card` is present in a given response (never both).
    class CreateCustomerCardResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :card, Square::Types::Card, optional: true, nullable: false

    end
  end
end
