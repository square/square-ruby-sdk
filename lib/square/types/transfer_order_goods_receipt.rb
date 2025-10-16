# frozen_string_literal: true

module Square
  module Types
    # The goods receipt details for a transfer order. This object represents a single receipt
    # of goods against a transfer order, tracking:
    #
    # - Which [CatalogItemVariation](entity:CatalogItemVariation)s were received
    # - Quantities received in good condition
    # - Quantities damaged during transit/handling
    # - Quantities canceled during receipt
    #
    # Multiple goods receipts can be created for a single transfer order to handle:
    # - Partial deliveries
    # - Multiple shipments
    # - Split receipts across different dates
    # - Cancellations of specific quantities
    #
    # Each receipt automatically:
    # - Updates the transfer order status
    # - Adjusts received quantities
    # - Updates inventory levels at both source and destination [Location](entity:Location)s
    class TransferOrderGoodsReceipt < Internal::Types::Model
      field :line_items, lambda {
        Internal::Types::Array[Square::Types::TransferOrderGoodsReceiptLineItem]
      }, optional: true, nullable: false
    end
  end
end
