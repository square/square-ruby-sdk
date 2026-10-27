# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Published when a [Subscription](entity:Subscription) is updated.
    # Typically the `subscription.status` is updated as subscriptions become active
    # or cancelled.
    class SubscriptionUpdatedEvent < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true

      field :event_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :data, -> { Square::Types::SubscriptionUpdatedEventData }, optional: true, nullable: false
    end
  end
end
