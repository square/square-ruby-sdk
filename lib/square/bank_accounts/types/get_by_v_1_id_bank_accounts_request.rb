# frozen_string_literal: true

module Square
  module BankAccounts
    module Types
      class GetByV1IdBankAccountsRequest < Internal::Types::Model
        field :v_1_bank_account_id, -> { String }, optional: false, nullable: false, api_name: "v1_bank_account_id"
      end
    end
  end
end
