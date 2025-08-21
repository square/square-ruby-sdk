# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the `SearchCustomers` endpoint.
    #
    # Either `errors` or `customers` is present in a given response (never both).
    class SearchCustomersResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :customers, -> { Internal::Types::Array[Square::Types::Customer] }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
      field :count, -> { Integer }, optional: true, nullable: false
    end
  end
end
