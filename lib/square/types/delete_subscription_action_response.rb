# frozen_string_literal: true

module Square
  module Types
    # Defines output parameters in a response of the [DeleteSubscriptionAction](api-endpoint:Subscriptions-DeleteSubscriptionAction)
    # endpoint.
    class DeleteSubscriptionActionResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :subscription, -> { Square::Types::Subscription }, optional: true, nullable: false
    end
  end
end
