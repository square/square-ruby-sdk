# frozen_string_literal: true

module Square
  module Types
    # Represents additional data for rules with the `VISIT` accrual type.
    class LoyaltyProgramAccrualRuleVisitData < Internal::Types::Model
      field :minimum_amount_money, Square::Types::Money, optional: true, nullable: false
      field :tax_mode, Square::Types::LoyaltyProgramAccrualRuleTaxMode, optional: false, nullable: false

    end
  end
end
