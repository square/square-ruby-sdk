
module Square
  module Loyalty
    module Programs
      module Promotions
        module Types
          class CreateLoyaltyPromotionRequest < Internal::Types::Model
            field :program_id, -> { String }, optional: false, nullable: false
            field :loyalty_promotion, -> { Square::Types::LoyaltyPromotion }, optional: false, nullable: false
            field :idempotency_key, -> { String }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
