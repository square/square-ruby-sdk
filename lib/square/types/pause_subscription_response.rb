# frozen_string_literal: true

module Square
  # Defines output parameters in a response from the
  # [PauseSubscription](api-endpoint:Subscriptions-PauseSubscription) endpoint.
  class PauseSubscriptionResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :subscription, Square::Subscription, optional: true, nullable: false
    field :actions, Internal::Types::Array[Square::SubscriptionAction], optional: true, nullable: false

  end
end
