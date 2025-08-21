# frozen_string_literal: true

module Square
  module Types
    class LoyaltyEventCreatedEventObject < Internal::Types::Model
      field :loyalty_event, -> { Square::Types::LoyaltyEvent }, optional: true, nullable: false
    end
  end
end
