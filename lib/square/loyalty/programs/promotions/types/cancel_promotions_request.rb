# frozen_string_literal: true

module Square
  module Loyalty
    module Programs
      module Promotions
        module Types
          class CancelPromotionsRequest < Internal::Types::Model
            field :program_id, -> { String }, optional: false, nullable: false
            field :promotion_id, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
