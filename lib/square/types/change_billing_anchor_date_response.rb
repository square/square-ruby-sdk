# frozen_string_literal: true

module Square
  # Defines output parameters in a request to the
  # [ChangeBillingAnchorDate](api-endpoint:Subscriptions-ChangeBillingAnchorDate) endpoint.
  class ChangeBillingAnchorDateResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :subscription, Square::Subscription, optional: true, nullable: false
    field :actions, Internal::Types::Array[Square::SubscriptionAction], optional: true, nullable: false

  end
end
