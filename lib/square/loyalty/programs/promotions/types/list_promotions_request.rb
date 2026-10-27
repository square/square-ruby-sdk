# frozen_string_literal: true

module Square
  module Loyalty
    module Programs
      module Promotions
        module Types
          class ListPromotionsRequest < Internal::Types::Model
            field :program_id, -> { String }, optional: false, nullable: false

            field :status, -> { Square::Types::LoyaltyPromotionStatus }, optional: true, nullable: true

            field :cursor, -> { String }, optional: true, nullable: true

            field :limit, -> { Integer }, optional: true, nullable: true
          end
        end
      end
    end
  end
end
