# frozen_string_literal: true

module Square
  module BankAccounts
    module Types
      class DisableBankAccountRequest < Internal::Types::Model
        field :bank_account_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
