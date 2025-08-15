# frozen_string_literal: true

module Square
  # A response that includes loyalty account created.
  class CreateLoyaltyAccountResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :loyalty_account, Square::LoyaltyAccount, optional: true, nullable: false

  end
end
