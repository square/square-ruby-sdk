# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module InventoryAdjustmentReasonDirection
      extend Square::Internal::Types::Enum

      INCREASE = "INCREASE"
      DECREASE = "DECREASE"
    end
  end
end
