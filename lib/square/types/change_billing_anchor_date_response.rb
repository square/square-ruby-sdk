# frozen_string_literal: true

module Square
  module Types
    # Defines output parameters in a request to the
    # [ChangeBillingAnchorDate](api-endpoint:Subscriptions-ChangeBillingAnchorDate) endpoint.
    class ChangeBillingAnchorDateResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :subscription, -> { Square::Types::Subscription }, optional: true, nullable: false
      field :actions, -> { Internal::Types::Array[Square::Types::SubscriptionAction] }, optional: true, nullable: false
    end
  end
end
