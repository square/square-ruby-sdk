# frozen_string_literal: true

module Square
  module Subscriptions
    module Types
      class PauseSubscriptionRequest < Internal::Types::Model
        field :subscription_id, -> { String }, optional: false, nullable: false

        field :pause_effective_date, -> { String }, optional: true, nullable: true

        field :pause_cycle_duration, -> { Integer }, optional: true, nullable: true

        field :resume_effective_date, -> { String }, optional: true, nullable: true

        field :resume_change_timing, -> { Square::Types::ChangeTiming }, optional: true, nullable: false

        field :pause_reason, -> { String }, optional: true, nullable: true
      end
    end
  end
end
