# frozen_string_literal: true

module Square
  module Loyalty
    module Accounts
      module Types
        class SearchLoyaltyAccountsRequest < Internal::Types::Model
          field :query, -> { Square::Types::SearchLoyaltyAccountsRequestLoyaltyAccountQuery }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :cursor, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
