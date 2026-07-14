# frozen_string_literal: true

module Square
  module Types
    module InventoryAdjustmentReasonIdType
      extend Square::Internal::Types::Enum

      RECEIVED = "RECEIVED"
      DAMAGED = "DAMAGED"
      THEFT = "THEFT"
      LOST = "LOST"
      RETURNED = "RETURNED"
      SPOILAGE_WASTE = "SPOILAGE_WASTE"
      SAMPLES_PROMOTIONAL = "SAMPLES_PROMOTIONAL"
      INTERNAL_USE = "INTERNAL_USE"
      VENDOR_RETURN = "VENDOR_RETURN"
      PRODUCTION_WASTE = "PRODUCTION_WASTE"
      SALE = "SALE"
      RECOUNT = "RECOUNT"
      TRANSFER = "TRANSFER"
      IN_TRANSIT = "IN_TRANSIT"
      CANCELED_SALE = "CANCELED_SALE"
      CUSTOM = "CUSTOM"
    end
  end
end
