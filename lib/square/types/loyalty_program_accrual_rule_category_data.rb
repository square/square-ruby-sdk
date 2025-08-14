# frozen_string_literal: true

module Square
    module Types
        # Represents additional data for rules with the `CATEGORY` accrual type.
        class LoyaltyProgramAccrualRuleCategoryData < Square::Internal::Types::Model
            field :category_id, String, optional: false, nullable: false
        end
    end
end
