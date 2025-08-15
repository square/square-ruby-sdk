# frozen_string_literal: true

module Square
  # Provides metadata when the event `type` is `ACCUMULATE_POINTS`.
  class LoyaltyEventAccumulatePoints < Internal::Types::Model
    field :loyalty_program_id, String, optional: true, nullable: false
    field :points, Integer, optional: true, nullable: false
    field :order_id, String, optional: true, nullable: false

  end
end
