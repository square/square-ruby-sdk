# frozen_string_literal: true

module SquareApiClient
# Indicates how taxes should be treated when calculating the purchase amount used
#  for loyalty points accrual.
#  This setting applies only to `SPEND` accrual rules or `VISIT` accrual rules that
#  have a minimum spend requirement.
  class LoyaltyProgramAccrualRuleTaxMode

    BEFORE_TAX = "BEFORE_TAX"
    AFTER_TAX = "AFTER_TAX"

  end
end