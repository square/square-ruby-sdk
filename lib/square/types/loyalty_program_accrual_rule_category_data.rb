# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents additional data for rules with the `CATEGORY` accrual type.
    class LoyaltyProgramAccrualRuleCategoryData < Internal::Types::Model
      field :category_id, -> { String }, optional: false, nullable: false
    end
  end
end
