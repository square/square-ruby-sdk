# frozen_string_literal: true

module Square
  module Types
    # A response that includes the loyalty reward created.
    class CreateLoyaltyRewardResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :reward, -> { Square::Types::LoyaltyReward }, optional: true, nullable: false
    end
  end
end
