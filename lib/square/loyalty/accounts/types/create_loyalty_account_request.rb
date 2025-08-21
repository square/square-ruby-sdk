# frozen_string_literal: true

module Square
  module Loyalty
    module Accounts
      module Types
        class CreateLoyaltyAccountRequest < Internal::Types::Model
          field :loyalty_account, -> { Square::Types::LoyaltyAccount }, optional: false, nullable: false
          field :idempotency_key, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
