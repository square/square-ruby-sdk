# frozen_string_literal: true

module Square
    module Types
        # A collection of various money amounts.
        class OrderMoneyAmounts < Square::Internal::Types::Model
            field :total_money, Square::Money, optional: true, nullable: false
            field :tax_money, Square::Money, optional: true, nullable: false
            field :discount_money, Square::Money, optional: true, nullable: false
            field :tip_money, Square::Money, optional: true, nullable: false
            field :service_charge_money, Square::Money, optional: true, nullable: false
        end
    end
end
