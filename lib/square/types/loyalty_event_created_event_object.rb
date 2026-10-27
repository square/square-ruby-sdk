# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class LoyaltyEventCreatedEventObject < Internal::Types::Model
      field :loyalty_event, -> { Square::Types::LoyaltyEvent }, optional: true, nullable: false
    end
  end
end
