# frozen_string_literal: true

module Square
  module Loyalty
    module Accounts
      module Types
        class GetAccountsRequest < Internal::Types::Model
          field :account_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
