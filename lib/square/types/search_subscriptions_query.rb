# frozen_string_literal: true

module Square
  # Represents a query, consisting of specified query expressions, used to search for subscriptions.
  class SearchSubscriptionsQuery < Internal::Types::Model
    field :filter, Square::SearchSubscriptionsFilter, optional: true, nullable: false

  end
end
