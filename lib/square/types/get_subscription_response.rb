# frozen_string_literal: true

module Square
  module Types
    # Defines output parameters in a response from the
    # [RetrieveSubscription](api-endpoint:Subscriptions-RetrieveSubscription) endpoint.
    class GetSubscriptionResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :subscription, -> { Square::Types::Subscription }, optional: true, nullable: false

    end
  end
end
