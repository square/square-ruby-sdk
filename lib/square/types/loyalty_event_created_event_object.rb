# frozen_string_literal: true

module Square
  class LoyaltyEventCreatedEventObject < Internal::Types::Model
    field :loyalty_event, Square::LoyaltyEvent, optional: true, nullable: false

  end
end
