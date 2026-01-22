# frozen_string_literal: true

module Square
  module Types
    # Response object returned by `DisableBankAccount`.
    class DisableBankAccountResponse < Internal::Types::Model
      field :bank_account, -> { Square::Types::BankAccount }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
