# frozen_string_literal: true

module Square
  # Defines output parameters in a response from the
  # [RetrieveSubscription](api-endpoint:Subscriptions-RetrieveSubscription) endpoint.
  class GetSubscriptionResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :subscription, Square::Subscription, optional: true, nullable: false

  end
end
