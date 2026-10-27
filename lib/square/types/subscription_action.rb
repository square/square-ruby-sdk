# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents an action as a pending change to a subscription.
    class SubscriptionAction < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :type, -> { Square::Types::SubscriptionActionType }, optional: true, nullable: false

      field :effective_date, -> { String }, optional: true, nullable: true

      field :monthly_billing_anchor_date, -> { Integer }, optional: true, nullable: true

      field :phases, -> { Internal::Types::Array[Square::Types::Phase] }, optional: true, nullable: true

      field :new_plan_variation_id, -> { String }, optional: true, nullable: true
    end
  end
end
