# frozen_string_literal: true

module Square
  module Types
    # Represents a Square loyalty program. Loyalty programs define how buyers can earn points and redeem points for rewards. 
    # Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. 
    # For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).
    class LoyaltyProgram < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :status, Square::Types::LoyaltyProgramStatus, optional: true, nullable: false
      field :reward_tiers, Internal::Types::Array[Square::Types::LoyaltyProgramRewardTier], optional: true, nullable: false
      field :expiration_policy, Square::Types::LoyaltyProgramExpirationPolicy, optional: true, nullable: false
      field :terminology, Square::Types::LoyaltyProgramTerminology, optional: true, nullable: false
      field :location_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :updated_at, String, optional: true, nullable: false
      field :accrual_rules, Internal::Types::Array[Square::Types::LoyaltyProgramAccrualRule], optional: true, nullable: false

    end
  end
end
