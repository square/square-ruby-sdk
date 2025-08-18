
module Square
  module Subscriptions
    module Types
      class DeleteActionSubscriptionsRequest < Internal::Types::Model
        field :subscription_id, -> { String }, optional: false, nullable: false
        field :action_id, -> { String }, optional: false, nullable: false

      end
    end
  end
end
