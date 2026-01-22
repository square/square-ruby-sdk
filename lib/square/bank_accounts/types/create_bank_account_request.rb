# frozen_string_literal: true

module Square
  module BankAccounts
    module Types
      class CreateBankAccountRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false
        field :source_id, -> { String }, optional: false, nullable: false
        field :customer_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
