
module Square
  module BankAccounts
    class ListBankAccountsRequest
      field :cursor, String, optional: true, nullable: false
      field :limit, Integer, optional: true, nullable: false
      field :location_id, String, optional: true, nullable: false

    end
  end
end
