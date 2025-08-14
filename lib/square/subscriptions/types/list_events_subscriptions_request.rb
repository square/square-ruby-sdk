
module Square
    module Subscriptions
        class ListEventsSubscriptionsRequest
            field :subscription_id, String, optional: false, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :limit, Integer, optional: true, nullable: false
        end
    end
end
