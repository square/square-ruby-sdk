# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # The search criteria for the loyalty accounts.
    class SearchLoyaltyAccountsRequestLoyaltyAccountQuery < Internal::Types::Model
      field :mappings, -> { Internal::Types::Array[Square::Types::LoyaltyAccountMapping] }, optional: true, nullable: true

      field :customer_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true
    end
  end
end
