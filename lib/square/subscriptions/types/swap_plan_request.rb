
module Square
  module Subscriptions
    module Types
      class SwapPlanRequest < Internal::Types::Model
        field :subscription_id, -> { String }, optional: false, nullable: false
        field :new_plan_variation_id, -> { String }, optional: true, nullable: false
        field :phases, -> { Internal::Types::Array[Square::Types::PhaseInput] }, optional: true, nullable: false

      end
    end
  end
end
