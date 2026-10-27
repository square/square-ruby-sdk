# frozen_string_literal: true

module Square
  module Subscriptions
    module Types
      class ListEventsSubscriptionsRequest < Internal::Types::Model
        field :subscription_id, -> { String }, optional: false, nullable: false

        field :cursor, -> { String }, optional: true, nullable: true

        field :limit, -> { Integer }, optional: true, nullable: true
      end
    end
  end
end
