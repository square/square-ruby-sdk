# frozen_string_literal: true

module Square
    module Types
        # Provides metadata when the event `type` is `ADJUST_POINTS`.
        class LoyaltyEventAdjustPoints < Square::Internal::Types::Model
            field :loyalty_program_id, String, optional: true, nullable: false
            field :points, Integer, optional: false, nullable: false
            field :reason, String, optional: true, nullable: false
        end
    end
end
