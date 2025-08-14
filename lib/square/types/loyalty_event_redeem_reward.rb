# frozen_string_literal: true

module Square
    module Types
        # Provides metadata when the event `type` is `REDEEM_REWARD`.
        class LoyaltyEventRedeemReward < Internal::Types::Model
            field :loyalty_program_id, String, optional: true, nullable: false
            field :reward_id, String, optional: true, nullable: false
            field :order_id, String, optional: true, nullable: false
        end
    end
end
