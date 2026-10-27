# frozen_string_literal: true

module Square
  module Subscriptions
    module Types
      class GetSubscriptionsRequest < Internal::Types::Model
        field :subscription_id, -> { String }, optional: false, nullable: false

        field :include, -> { String }, optional: true, nullable: true
      end
    end
  end
end
