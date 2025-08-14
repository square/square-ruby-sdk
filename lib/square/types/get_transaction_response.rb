# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the response body of
    # a request to the [RetrieveTransaction](api-endpoint:Transactions-RetrieveTransaction) endpoint.
    # 
    # One of `errors` or `transaction` is present in a given response (never both).
    class GetTransactionResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :transaction, Square::Transaction, optional: true, nullable: false

    end
  end
end
