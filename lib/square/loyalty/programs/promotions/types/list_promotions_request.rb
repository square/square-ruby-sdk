
module Square
  module Loyalty
    module Programs
      module Promotions
        class ListPromotionsRequest
          field :program_id, String, optional: false, nullable: false
          field :status, Square::LoyaltyPromotionStatus, optional: true, nullable: false
          field :cursor, String, optional: true, nullable: false
          field :limit, Integer, optional: true, nullable: false

        end
      end
    end
  end
end
