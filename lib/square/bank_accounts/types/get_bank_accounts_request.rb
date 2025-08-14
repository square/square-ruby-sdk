
module Square
    module BankAccounts
        class GetBankAccountsRequest < Square::Internal::Types::Model
            field :bank_account_id, String, optional: false, nullable: false
        end
    end
end
