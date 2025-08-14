# frozen_string_literal: true

module Square
    module Types
        # Represents additional data for rules with the `VISIT` accrual type.
        class LoyaltyProgramAccrualRuleVisitData < Square::Internal::Types::Model
            field :minimum_amount_money, Square::Money, optional: true, nullable: false
            field :tax_mode, Square::LoyaltyProgramAccrualRuleTaxMode, optional: false, nullable: false
        end
    end
end
