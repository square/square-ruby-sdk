# frozen_string_literal: true

module Square
  # Represents a set of query expressions (filters) to narrow the scope of targeted subscriptions returned by 
  # the [SearchSubscriptions](api-endpoint:Subscriptions-SearchSubscriptions) endpoint.
  class SearchSubscriptionsFilter < Internal::Types::Model
    field :customer_ids, Internal::Types::Array[String], optional: true, nullable: false
    field :location_ids, Internal::Types::Array[String], optional: true, nullable: false
    field :source_names, Internal::Types::Array[String], optional: true, nullable: false

  end
end
