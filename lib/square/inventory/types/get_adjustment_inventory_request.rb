# frozen_string_literal: true

module Square
  module Inventory
    module Types
      class GetAdjustmentInventoryRequest < Internal::Types::Model
        field :adjustment_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
