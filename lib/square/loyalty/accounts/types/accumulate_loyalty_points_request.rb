
module Square
  module Loyalty
    module Accounts
      module Types
        class AccumulateLoyaltyPointsRequest < Internal::Types::Model
          field :account_id, -> { String }, optional: false, nullable: false
          field :accumulate_points, -> { Square::Types::LoyaltyEventAccumulatePoints }, optional: false, nullable: false
          field :idempotency_key, -> { String }, optional: false, nullable: false
          field :location_id, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
