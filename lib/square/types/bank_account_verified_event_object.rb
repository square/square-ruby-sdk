# frozen_string_literal: true

module Square
    module Types
        class BankAccountVerifiedEventObject < Square::Internal::Types::Model
            field :bank_account, Square::BankAccount, optional: true, nullable: false
        end
    end
end
