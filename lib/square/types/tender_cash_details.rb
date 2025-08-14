# frozen_string_literal: true

module Square
    module Types
        # Represents the details of a tender with `type` `CASH`.
        class TenderCashDetails < Internal::Types::Model
            field :buyer_tendered_money, Square::Money, optional: true, nullable: false
            field :change_back_money, Square::Money, optional: true, nullable: false
        end
    end
end
