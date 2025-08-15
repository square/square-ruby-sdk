# frozen_string_literal: true

module Square
  # Defines output parameters in a response from the 
  # [ResumeSubscription](api-endpoint:Subscriptions-ResumeSubscription) endpoint.
  class ResumeSubscriptionResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :subscription, Square::Subscription, optional: true, nullable: false
    field :actions, Internal::Types::Array[Square::SubscriptionAction], optional: true, nullable: false

  end
end
