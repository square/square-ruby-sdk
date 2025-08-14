# frozen_string_literal: true

module Square
    module Types
        # Additional details about `WALLET` type payments with the `brand` of `CASH_APP`.
        class CashAppDetails < Internal::Types::Model
            field :buyer_full_name, String, optional: true, nullable: false
            field :buyer_country_code, String, optional: true, nullable: false
            field :buyer_cashtag, String, optional: true, nullable: false
        end
    end
end
