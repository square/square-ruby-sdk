# frozen_string_literal: true

module Square
  module Loyalty
    module Programs
      module Types
        class CalculateLoyaltyPointsRequest < Internal::Types::Model
          field :program_id, -> { String }, optional: false, nullable: false

          field :order_id, -> { String }, optional: true, nullable: true

          field :transaction_amount_money, -> { Square::Types::Money }, optional: true, nullable: false

          field :loyalty_account_id, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
