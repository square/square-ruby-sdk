# frozen_string_literal: true

module Square
  module Types
    # Defines output parameters in a response from the
    # [CreateSubscription](api-endpoint:Subscriptions-CreateSubscription) endpoint.
    class CreateSubscriptionResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :subscription, Square::Subscription, optional: true, nullable: false

    end
  end
end
