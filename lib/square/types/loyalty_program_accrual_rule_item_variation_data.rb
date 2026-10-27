# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents additional data for rules with the `ITEM_VARIATION` accrual type.
    class LoyaltyProgramAccrualRuleItemVariationData < Internal::Types::Model
      field :item_variation_id, -> { String }, optional: false, nullable: false
    end
  end
end
