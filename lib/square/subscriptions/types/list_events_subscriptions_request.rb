
module Square
  module Subscriptions
    class ListEventsSubscriptionsRequest < Internal::Types::Model
      field :subscription_id, String, optional: false, nullable: false
      field :cursor, String, optional: true, nullable: false
      field :limit, Integer, optional: true, nullable: false

    end
  end
end
