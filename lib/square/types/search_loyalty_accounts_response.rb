# frozen_string_literal: true

module Square
  module Types
    # A response that includes loyalty accounts that satisfy the search criteria.
    class SearchLoyaltyAccountsResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :loyalty_accounts, Internal::Types::Array[Square::Types::LoyaltyAccount], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false

    end
  end
end
