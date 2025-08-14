
module Square
    module Subscriptions
        class PauseSubscriptionRequest < Square::Internal::Types::Model
            field :subscription_id, String, optional: false, nullable: false
        end
    end
end
