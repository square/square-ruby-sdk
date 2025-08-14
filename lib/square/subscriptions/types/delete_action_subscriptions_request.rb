
module Square
    module Subscriptions
        class DeleteActionSubscriptionsRequest
            field :subscription_id, String, optional: false, nullable: false
            field :action_id, String, optional: false, nullable: false
        end
    end
end
