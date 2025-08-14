# frozen_string_literal: true

module Square
    module Types
        # Represents the details of a tender with `type` `BANK_ACCOUNT`.
        # 
        # See [BankAccountPaymentDetails](entity:BankAccountPaymentDetails)
        # for more exposed details of a bank account payment.
        class TenderBankAccountDetails < Internal::Types::Model
            field :status, Square::TenderBankAccountDetailsStatus, optional: true, nullable: false
        end
    end
end
