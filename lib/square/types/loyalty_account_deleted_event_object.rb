# frozen_string_literal: true

module Square
  module Types
    class LoyaltyAccountDeletedEventObject < Internal::Types::Model
      field :loyalty_account, -> { Square::Types::LoyaltyAccount }, optional: true, nullable: false
    end
  end
end
