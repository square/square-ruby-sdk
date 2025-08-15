# frozen_string_literal: true

module Square
  class LoyaltyAccountCreatedEventObject < Internal::Types::Model
    field :loyalty_account, Square::LoyaltyAccount, optional: true, nullable: false

  end
end
