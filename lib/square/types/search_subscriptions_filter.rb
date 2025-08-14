# frozen_string_literal: true

module Square
    module Types
        # Represents a set of query expressions (filters) to narrow the scope of targeted subscriptions returned by 
        # the [SearchSubscriptions](api-endpoint:Subscriptions-SearchSubscriptions) endpoint.
        class SearchSubscriptionsFilter < Square::Internal::Types::Model
            field :customer_ids, Square::Internal::Types::Array[String], optional: true, nullable: false
            field :location_ids, Square::Internal::Types::Array[String], optional: true, nullable: false
            field :source_names, Square::Internal::Types::Array[String], optional: true, nullable: false
        end
    end
end
