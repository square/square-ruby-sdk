# frozen_string_literal: true

module Square
  module Types
    # Filter events by loyalty account.
    class LoyaltyEventLoyaltyAccountFilter < Internal::Types::Model
      field :loyalty_account_id, String, optional: false, nullable: false

    end
  end
end
