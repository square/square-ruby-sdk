# frozen_string_literal: true

module Square
  module Subscriptions
    module Types
      class SwapPlanRequest < Internal::Types::Model
        field :subscription_id, -> { String }, optional: false, nullable: false

        field :new_plan_variation_id, -> { String }, optional: true, nullable: true

        field :phases, -> { Internal::Types::Array[Square::Types::PhaseInput] }, optional: true, nullable: true
      end
    end
  end
end
