# frozen_string_literal: true

module Square
  module BankAccounts
    module Types
      class ListBankAccountsRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: true

        field :limit, -> { Integer }, optional: true, nullable: true

        field :location_id, -> { String }, optional: true, nullable: true

        field :customer_id, -> { String }, optional: true, nullable: true
      end
    end
  end
end
