
module Square
    module Subscriptions
        class GetSubscriptionsRequest < Square::Internal::Types::Model
            field :subscription_id, String, optional: false, nullable: false
            field :include, String, optional: true, nullable: false
        end
    end
end
