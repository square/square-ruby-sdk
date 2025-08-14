# frozen_string_literal: true

module Square
    module Types
        # The search criteria for the loyalty accounts.
        class SearchLoyaltyAccountsRequestLoyaltyAccountQuery < Internal::Types::Model
            field :mappings, Internal::Types::Array[Square::LoyaltyAccountMapping], optional: true, nullable: false
            field :customer_ids, Internal::Types::Array[String], optional: true, nullable: false
        end
    end
end
