# frozen_string_literal: true

module Square
  module Types
    # Defines output parameters in a response from the 
    # [CancelSubscription](api-endpoint:Subscriptions-CancelSubscription) endpoint.
    class CancelSubscriptionResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :subscription, Square::Types::Subscription, optional: true, nullable: false
      field :actions, Internal::Types::Array[Square::Types::SubscriptionAction], optional: true, nullable: false

    end
  end
end
