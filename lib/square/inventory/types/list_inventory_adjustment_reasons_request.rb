# frozen_string_literal: true

module Square
  module Inventory
    module Types
      class ListInventoryAdjustmentReasonsRequest < Internal::Types::Model
        field :include_deleted, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :include_system_codes, -> { Internal::Types::Boolean }, optional: true, nullable: true
      end
    end
  end
end
