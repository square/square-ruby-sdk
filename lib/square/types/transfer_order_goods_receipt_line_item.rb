# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A simplified line item for goods receipts in transfer orders
    class TransferOrderGoodsReceiptLineItem < Internal::Types::Model
      field :transfer_order_line_uid, -> { String }, optional: false, nullable: false

      field :quantity_received, -> { String }, optional: true, nullable: true

      field :quantity_damaged, -> { String }, optional: true, nullable: true

      field :quantity_canceled, -> { String }, optional: true, nullable: true
    end
  end
end
