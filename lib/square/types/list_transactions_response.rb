# frozen_string_literal: true

module Square
  # Defines the fields that are included in the response body of
  # a request to the [ListTransactions](api-endpoint:Transactions-ListTransactions) endpoint.
  # 
  # One of `errors` or `transactions` is present in a given response (never both).
  class ListTransactionsResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :transactions, Internal::Types::Array[Square::Transaction], optional: true, nullable: false
    field :cursor, String, optional: true, nullable: false

  end
end
