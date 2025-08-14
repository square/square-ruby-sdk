# frozen_string_literal: true

module Square
    module Types
        # Response object returned by ListBankAccounts.
        class ListBankAccountsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :bank_accounts, Square::Internal::Types::Array[Square::BankAccount], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
