
module Square
  module Webhooks
    module Subscriptions
      class ListSubscriptionsRequest < Internal::Types::Model
        field :cursor, String, optional: true, nullable: false
        field :include_disabled, Internal::Types::Boolean, optional: true, nullable: false
        field :sort_order, Square::SortOrder, optional: true, nullable: false
        field :limit, Integer, optional: true, nullable: false

      end
    end
  end
end
