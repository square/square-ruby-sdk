# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Provides metadata when the event `type` is `ACCUMULATE_POINTS`.
    class LoyaltyEventAccumulatePoints < Internal::Types::Model
      field :loyalty_program_id, -> { String }, optional: true, nullable: false

      field :points, -> { Integer }, optional: true, nullable: true

      field :order_id, -> { String }, optional: true, nullable: true
    end
  end
end
