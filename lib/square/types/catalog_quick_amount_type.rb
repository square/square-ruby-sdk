# frozen_string_literal: true

module Square
  module Types
    module CatalogQuickAmountType
      extend Square::Internal::Types::Enum

      QUICK_AMOUNT_TYPE_MANUAL = "QUICK_AMOUNT_TYPE_MANUAL"
      QUICK_AMOUNT_TYPE_AUTO = "QUICK_AMOUNT_TYPE_AUTO"
    end
  end
end
