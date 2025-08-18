# frozen_string_literal: true

module Square
  module Types
    # Response object returned by ListBankAccounts.
    class ListBankAccountsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :bank_accounts, Internal::Types::Array[Square::Types::BankAccount], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false

    end
  end
end
