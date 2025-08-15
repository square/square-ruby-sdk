# frozen_string_literal: true

module Square
  # Defines the fields that are included in the response body of
  # a request to the `CreateCustomerCard` endpoint.
  # 
  # Either `errors` or `card` is present in a given response (never both).
  class CreateCustomerCardResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :card, Square::Card, optional: true, nullable: false

  end
end
