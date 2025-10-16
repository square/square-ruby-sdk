# frozen_string_literal: true

module Square
  module Types
    # A simplified line item for goods receipts in transfer orders
    class TransferOrderGoodsReceiptLineItem < Internal::Types::Model
      field :transfer_order_line_uid, -> { String }, optional: false, nullable: false
      field :quantity_received, -> { String }, optional: true, nullable: false
      field :quantity_damaged, -> { String }, optional: true, nullable: false
      field :quantity_canceled, -> { String }, optional: true, nullable: false
    end
  end
end
