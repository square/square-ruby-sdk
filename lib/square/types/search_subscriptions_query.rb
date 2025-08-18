# frozen_string_literal: true

module Square
  module Types
    # Represents a query, consisting of specified query expressions, used to search for subscriptions.
    class SearchSubscriptionsQuery < Internal::Types::Model
      field :filter, -> { Square::Types::SearchSubscriptionsFilter }, optional: true, nullable: false

    end
  end
end
