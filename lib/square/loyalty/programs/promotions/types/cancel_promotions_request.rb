
module Square
  module Loyalty
    module Programs
      module Promotions
        class CancelPromotionsRequest < Internal::Types::Model
          field :promotion_id, String, optional: false, nullable: false
          field :program_id, String, optional: false, nullable: false

        end
      end
    end
  end
end
