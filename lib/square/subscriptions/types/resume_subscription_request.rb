
module Square
    module Subscriptions
        class ResumeSubscriptionRequest < Square::Internal::Types::Model
            field :subscription_id, String, optional: false, nullable: false
        end
    end
end
