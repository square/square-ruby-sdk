# frozen_string_literal: true

module Square
  module Webhooks
    module Subscriptions
      module Types
        class ListSubscriptionsRequest < Internal::Types::Model
          field :cursor, -> { String }, optional: true, nullable: true

          field :include_disabled, -> { Internal::Types::Boolean }, optional: true, nullable: true

          field :sort_order, -> { Square::Types::SortOrder }, optional: true, nullable: true

          field :limit, -> { Integer }, optional: true, nullable: true
        end
      end
    end
  end
end
