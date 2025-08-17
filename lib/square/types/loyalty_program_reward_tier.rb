# frozen_string_literal: true

module Square
  module Types
    # Represents a reward tier in a loyalty program. A reward tier defines how buyers can redeem points for a reward, such as the number of points required and the value and scope of the discount. A loyalty program can offer multiple reward tiers.
    class LoyaltyProgramRewardTier < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :points, Integer, optional: false, nullable: false
      field :name, String, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :pricing_rule_reference, Square::Types::CatalogObjectReference, optional: false, nullable: false

    end
  end
end
