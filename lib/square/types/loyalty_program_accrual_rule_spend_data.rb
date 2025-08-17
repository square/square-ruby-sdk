# frozen_string_literal: true

module Square
  module Types
    # Represents additional data for rules with the `SPEND` accrual type.
    class LoyaltyProgramAccrualRuleSpendData < Internal::Types::Model
      field :amount_money, Square::Types::Money, optional: false, nullable: false
      field :excluded_category_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :excluded_item_variation_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :tax_mode, Square::Types::LoyaltyProgramAccrualRuleTaxMode, optional: false, nullable: false

    end
  end
end
