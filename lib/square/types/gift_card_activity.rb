# frozen_string_literal: true

module Square
  module Types
    # Represents an action performed on a [gift card](entity:GiftCard) that affects its state or balance. 
    # A gift card activity contains information about a specific activity type. For example, a `REDEEM` activity
    # includes a `redeem_activity_details` field that contains information about the redemption.
    class GiftCardActivity < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :type, -> { Square::Types::GiftCardActivityType }, optional: false, nullable: false
      field :location_id, -> { String }, optional: false, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :gift_card_id, -> { String }, optional: true, nullable: false
      field :gift_card_gan, -> { String }, optional: true, nullable: false
      field :gift_card_balance_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :load_activity_details, -> { Square::Types::GiftCardActivityLoad }, optional: true, nullable: false
      field :activate_activity_details, -> { Square::Types::GiftCardActivityActivate }, optional: true, nullable: false
      field :redeem_activity_details, -> { Square::Types::GiftCardActivityRedeem }, optional: true, nullable: false
      field :clear_balance_activity_details, -> { Square::Types::GiftCardActivityClearBalance }, optional: true, nullable: false
      field :deactivate_activity_details, -> { Square::Types::GiftCardActivityDeactivate }, optional: true, nullable: false
      field :adjust_increment_activity_details, -> { Square::Types::GiftCardActivityAdjustIncrement }, optional: true, nullable: false
      field :adjust_decrement_activity_details, -> { Square::Types::GiftCardActivityAdjustDecrement }, optional: true, nullable: false
      field :refund_activity_details, -> { Square::Types::GiftCardActivityRefund }, optional: true, nullable: false
      field :unlinked_activity_refund_activity_details, -> { Square::Types::GiftCardActivityUnlinkedActivityRefund }, optional: true, nullable: false
      field :import_activity_details, -> { Square::Types::GiftCardActivityImport }, optional: true, nullable: false
      field :block_activity_details, -> { Square::Types::GiftCardActivityBlock }, optional: true, nullable: false
      field :unblock_activity_details, -> { Square::Types::GiftCardActivityUnblock }, optional: true, nullable: false
      field :import_reversal_activity_details, -> { Square::Types::GiftCardActivityImportReversal }, optional: true, nullable: false
      field :transfer_balance_to_activity_details, -> { Square::Types::GiftCardActivityTransferBalanceTo }, optional: true, nullable: false
      field :transfer_balance_from_activity_details, -> { Square::Types::GiftCardActivityTransferBalanceFrom }, optional: true, nullable: false

    end
  end
end
