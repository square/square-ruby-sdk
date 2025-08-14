# frozen_string_literal: true

module Square
    module Types
        # Represents an accrual rule, which defines how buyers can earn points from the base [loyalty program](entity:LoyaltyProgram).
        class LoyaltyProgramAccrualRule < Square::Internal::Types::Model
            field :accrual_type, Square::LoyaltyProgramAccrualRuleType, optional: false, nullable: false
            field :points, Integer, optional: true, nullable: false
            field :visit_data, Square::LoyaltyProgramAccrualRuleVisitData, optional: true, nullable: false
            field :spend_data, Square::LoyaltyProgramAccrualRuleSpendData, optional: true, nullable: false
            field :item_variation_data, Square::LoyaltyProgramAccrualRuleItemVariationData, optional: true, nullable: false
            field :category_data, Square::LoyaltyProgramAccrualRuleCategoryData, optional: true, nullable: false
        end
    end
end
