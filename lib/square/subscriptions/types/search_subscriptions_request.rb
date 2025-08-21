# frozen_string_literal: true

module Square
  module Subscriptions
    module Types
      class SearchSubscriptionsRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :query, -> { Square::Types::SearchSubscriptionsQuery }, optional: true, nullable: false
        field :include, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      end
    end
  end
end
