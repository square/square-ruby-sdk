# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class LoyaltyAccountUpdatedEventObject < Internal::Types::Model
      field :loyalty_account, -> { Square::Types::LoyaltyAccount }, optional: true, nullable: false
    end
  end
end
