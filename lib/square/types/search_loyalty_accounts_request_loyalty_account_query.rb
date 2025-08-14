# frozen_string_literal: true

module Square
    module Types
        # The search criteria for the loyalty accounts.
        class SearchLoyaltyAccountsRequestLoyaltyAccountQuery < Square::Internal::Types::Model
            field :mappings, Square::Internal::Types::Array[Square::LoyaltyAccountMapping], optional: true, nullable: false
            field :customer_ids, Square::Internal::Types::Array[String], optional: true, nullable: false
        end
    end
end
