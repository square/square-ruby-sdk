# frozen_string_literal: true

module Square
  module Types
    # Defines output parameters in a response from the
    # [ListSubscriptionEvents](api-endpoint:Subscriptions-ListSubscriptionEvents).
    class ListSubscriptionEventsResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :subscription_events, -> { Internal::Types::Array[Square::Types::SubscriptionEvent] }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
    end
  end
end
