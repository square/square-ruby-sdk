# frozen_string_literal: true

module Square
  class BankAccountVerifiedEventObject < Internal::Types::Model
    field :bank_account, Square::BankAccount, optional: true, nullable: false

  end
end
