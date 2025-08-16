# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the `RetrieveCustomer` endpoint.
    # 
    # Either `errors` or `customer` is present in a given response (never both).
    class GetCustomerResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :customer, Square::Customer, optional: true, nullable: false

    end
  end
end
