# frozen_string_literal: true

module Square
  module Types
    # Response object returned by `GetBankAccount`.
    class GetBankAccountResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :bank_account, -> { Square::Types::BankAccount }, optional: true, nullable: false

    end
  end
end
