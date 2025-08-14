# frozen_string_literal: true

module Square
    module Types
        # A response that includes loyalty account created.
        class CreateLoyaltyAccountResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :loyalty_account, Square::LoyaltyAccount, optional: true, nullable: false
        end
    end
end
