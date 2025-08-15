# frozen_string_literal: true

module Square
  # The set of search requirements.
  class SearchLoyaltyRewardsRequestLoyaltyRewardQuery < Internal::Types::Model
    field :loyalty_account_id, String, optional: false, nullable: false
    field :status, Square::LoyaltyRewardStatus, optional: true, nullable: false

  end
end
