# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Filter events by loyalty account.
    class LoyaltyEventLoyaltyAccountFilter < Internal::Types::Model
      field :loyalty_account_id, -> { String }, optional: false, nullable: false
    end
  end
end
