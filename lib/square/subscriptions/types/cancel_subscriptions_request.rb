
module Square
  module Subscriptions
    module Types
      class CancelSubscriptionsRequest < Internal::Types::Model
        field :subscription_id, -> { String }, optional: false, nullable: false

      end
    end
  end
end
