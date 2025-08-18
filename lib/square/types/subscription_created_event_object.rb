# frozen_string_literal: true

module Square
  module Types
    class SubscriptionCreatedEventObject < Internal::Types::Model
      field :subscription, -> { Square::Types::Subscription }, optional: true, nullable: false

    end
  end
end
