# frozen_string_literal: true

module Square
  module Types
    # A response that includes the loyalty account.
    class GetLoyaltyAccountResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :loyalty_account, Square::LoyaltyAccount, optional: true, nullable: false

    end
  end
end
