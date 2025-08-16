# frozen_string_literal: true

module Square
  module Types
    # Represents an action performed on a [gift card](entity:GiftCard) that affects its state or balance. 
    # A gift card activity contains information about a specific activity type. For example, a `REDEEM` activity
    # includes a `redeem_activity_details` field that contains information about the redemption.
    class GiftCardActivity < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :type, Square::GiftCardActivityType, optional: false, nullable: false
      field :location_id, String, optional: false, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :gift_card_id, String, optional: true, nullable: false
      field :gift_card_gan, String, optional: true, nullable: false
      field :gift_card_balance_money, Square::Money, optional: true, nullable: false
      field :load_activity_details, Square::GiftCardActivityLoad, optional: true, nullable: false
      field :activate_activity_details, Square::GiftCardActivityActivate, optional: true, nullable: false
      field :redeem_activity_details, Square::GiftCardActivityRedeem, optional: true, nullable: false
      field :clear_balance_activity_details, Square::GiftCardActivityClearBalance, optional: true, nullable: false
      field :deactivate_activity_details, Square::GiftCardActivityDeactivate, optional: true, nullable: false
      field :adjust_increment_activity_details, Square::GiftCardActivityAdjustIncrement, optional: true, nullable: false
      field :adjust_decrement_activity_details, Square::GiftCardActivityAdjustDecrement, optional: true, nullable: false
      field :refund_activity_details, Square::GiftCardActivityRefund, optional: true, nullable: false
      field :unlinked_activity_refund_activity_details, Square::GiftCardActivityUnlinkedActivityRefund, optional: true, nullable: false
      field :import_activity_details, Square::GiftCardActivityImport, optional: true, nullable: false
      field :block_activity_details, Square::GiftCardActivityBlock, optional: true, nullable: false
      field :unblock_activity_details, Square::GiftCardActivityUnblock, optional: true, nullable: false
      field :import_reversal_activity_details, Square::GiftCardActivityImportReversal, optional: true, nullable: false
      field :transfer_balance_to_activity_details, Square::GiftCardActivityTransferBalanceTo, optional: true, nullable: false
      field :transfer_balance_from_activity_details, Square::GiftCardActivityTransferBalanceFrom, optional: true, nullable: false

    end
  end
end
