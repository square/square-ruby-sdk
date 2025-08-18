
module Square
  module Loyalty
    module Accounts
      module Types
        class AdjustLoyaltyPointsRequest < Internal::Types::Model
          field :account_id, -> { String }, optional: false, nullable: false
          field :idempotency_key, -> { String }, optional: false, nullable: false
          field :adjust_points, -> { Square::Types::LoyaltyEventAdjustPoints }, optional: false, nullable: false
          field :allow_negative_balance, -> { Internal::Types::Boolean }, optional: true, nullable: false

        end
      end
    end
  end
end
