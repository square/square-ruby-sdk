# frozen_string_literal: true

module Square
    module Types
        # Response object returned by `GetBankAccount`.
        class GetBankAccountResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :bank_account, Square::BankAccount, optional: true, nullable: false
        end
    end
end
