# frozen_string_literal: true

module Square
  module Types
    # A response that includes loyalty account created.
    class CreateLoyaltyAccountResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :loyalty_account, Square::Types::LoyaltyAccount, optional: true, nullable: false

    end
  end
end
