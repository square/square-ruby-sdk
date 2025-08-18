
module Square
  module Subscriptions
    module Types
      class UpdateSubscriptionRequest < Internal::Types::Model
        field :subscription_id, String, optional: false, nullable: false
        field :subscription, Square::Types::Subscription, optional: true, nullable: false

      end
    end
  end
end
