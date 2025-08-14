# frozen_string_literal: true

module Square
    module Types
        # Provides metadata when the event `type` is `CREATE_REWARD`.
        class LoyaltyEventCreateReward < Square::Internal::Types::Model
            field :loyalty_program_id, String, optional: true, nullable: false
            field :reward_id, String, optional: true, nullable: false
            field :points, Integer, optional: true, nullable: false
        end
    end
end
