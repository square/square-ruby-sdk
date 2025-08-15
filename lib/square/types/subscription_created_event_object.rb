# frozen_string_literal: true

module Square
  class SubscriptionCreatedEventObject < Internal::Types::Model
    field :subscription, Square::Subscription, optional: true, nullable: false

  end
end
