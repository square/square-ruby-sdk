# frozen_string_literal: true

module Square
    module Types
        class LoyaltyAccountCreatedEventObject < Square::Internal::Types::Model
            field :loyalty_account, Square::LoyaltyAccount, optional: true, nullable: false
        end
    end
end
